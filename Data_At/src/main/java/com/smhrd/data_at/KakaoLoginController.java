package com.smhrd.data_at;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.User;

@Controller
public class KakaoLoginController {
	@Autowired
	private com.smhrd.mapper.userMapper userMapper; // UserMapper 주입

	private static final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	private static final String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
	private static final String CLIENT_ID = "8f21cd3c7c3ae244e43320706c6db2dd";
	private static final String REDIRECT_URI = "http://localhost:8085/data_at/oauth/kakao/callback";

	@RequestMapping("/oauth/kakao/callback")
	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
		try {
			System.out.println("Code: " + code);
			System.out.println("Redirect URI: " + REDIRECT_URI);

			String accessToken = getAccessToken(code);
			System.out.println("Access Token: " + accessToken);

			Map<String, Object> userInfo = getUserInfo(accessToken);
			System.out.println("User Info: " + userInfo);

			// 사용자 정보 추출
			String userId = userInfo.get("id").toString(); // 카카오 사용자 ID
			Map<String, String> properties = (Map<String, String>) userInfo.get("properties");
			String userNick = properties.get("nickname"); // 사용자 닉네임

			// 1. 기존 사용자 확인
			User existingUser = userMapper.findByUserId(userId);

			if (existingUser == null) {
				// 2. 신규 사용자 등록
				User newUser = new User();
				newUser.setUser_id(userId);
				newUser.setUser_nick(userNick);
				newUser.setUser_credit(200) ;

				userMapper.saveUser(newUser); // DB에 저장
				existingUser = newUser;
				System.out.println("New user saved: " + userId);
			} else {
				System.out.println("User already exists: " + userId);
			}

			// 3. 세션 저장
			session.setAttribute("info", existingUser);
			// 추가 로직 (DB 저장 및 세션 처리)
			return "redirect:/MainPage";

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	private String getAccessToken(String code) throws Exception {
		System.out.println("Code received: " + code);
		System.out.println("Redirect URI being sent: " + REDIRECT_URI);

		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost post = new HttpPost(KAKAO_TOKEN_URL);

		String body = "grant_type=authorization_code" + "&client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI
				+ "&code=" + code;

		System.out.println("Request Body: " + body);

		post.setEntity(new StringEntity(body));
		post.setHeader("Content-Type", "application/x-www-form-urlencoded");

		CloseableHttpResponse response = httpClient.execute(post);
		String jsonResponse = EntityUtils.toString(response.getEntity());
		httpClient.close();

		System.out.println("Access Token Response: " + jsonResponse);

		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> tokenMap = objectMapper.readValue(jsonResponse, Map.class);

		if (!tokenMap.containsKey("access_token")) {
			throw new RuntimeException("Failed to get access token: " + jsonResponse);
		}

		return (String) tokenMap.get("access_token");
	}

	private Map<String, Object> getUserInfo(String accessToken) throws Exception {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost userInfoRequest = new HttpPost(KAKAO_USER_INFO_URL);

		userInfoRequest.setHeader("Authorization", "Bearer " + accessToken);
		CloseableHttpResponse response = httpClient.execute(userInfoRequest);

		String userInfoJson = EntityUtils.toString(response.getEntity());
		httpClient.close();

		System.out.println("User Info Response: " + userInfoJson);

		if (response.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed to get user info: " + userInfoJson);
		}

		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.readValue(userInfoJson, Map.class);
	}
}