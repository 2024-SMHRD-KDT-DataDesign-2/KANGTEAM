package com.smhrd.data_at;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
public class GoogleLoginController {

	@Autowired
	private com.smhrd.mapper.userMapper userMapper; // UserMapper 주입

	private static final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
	private static final String GOOGLE_USER_INFO_URL = "https://www.googleapis.com/oauth2/v3/userinfo";
	private static final String CLIENT_ID = "1021205739741-1gso2uuh3rpq9dqqmpg7argssuhocori.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = "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";
	private static final String REDIRECT_URI = "http://localhost:8085/data_at/oauth/google/callback";

	@RequestMapping("/oauth/google/callback")
	public String googleCallback(@RequestParam("code") String code, HttpSession session) {
		try {
			System.out.println("Code: " + code);
			System.out.println("Redirect URI: " + REDIRECT_URI);

			// 1. Access Token 요청
			String accessToken = getAccessToken(code);
			System.out.println("Access Token: " + accessToken);

			// 2. 사용자 정보 요청
			Map<String, Object> userInfo = getUserInfo(accessToken);
			System.out.println("User Info: " + userInfo);

			// 사용자 정보 추출
			String userId = userInfo.get("sub").toString();
			String userName = userInfo.get("name").toString();

			// 3. 기존 사용자 확인
			User existingUser = userMapper.findByUserId(userId);

			if (existingUser == null) {
				// 4. 신규 사용자 등록
				User newUser = new User();
				newUser.setUser_id(userId);
				newUser.setUser_nick(userName);

				userMapper.saveUser(newUser); // DB에 저장
				existingUser = newUser;
				System.out.println("New user saved: " + userId);
			} else {
				System.out.println("User already exists: " + userId);
			}

			// 5. 세션 저장
			session.setAttribute("info", existingUser);
			session.setAttribute("accessToken", accessToken);

			// 6. 홈으로 리다이렉트
			return "redirect:/MainPage";

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	private String getAccessToken(String code) throws Exception {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost post = new HttpPost(GOOGLE_TOKEN_URL);

		String body = "code=" + code + "&client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET + "&redirect_uri="
				+ REDIRECT_URI + "&grant_type=authorization_code";

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
		HttpPost userInfoRequest = new HttpPost(GOOGLE_USER_INFO_URL); // URL 수정

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
