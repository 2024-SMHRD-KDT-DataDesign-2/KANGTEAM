package com.smhrd.data_at;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.Base64;

import org.springframework.stereotype.Controller;

@Controller
public class ImageToBase64Converter {
	public static String ImageToBase64(String imageUrl) {
		try {
			// URL 객체 생성
			URL url = new URL(imageUrl);
			// URL에서 이미지 읽기
			InputStream inputStream = new BufferedInputStream(url.openStream());
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

			byte[] buffer = new byte[1024];
			int bytesRead;
			// 이미지 데이터를 바이트 배열로 읽기
			while ((bytesRead = inputStream.read(buffer, 0, buffer.length)) != -1) {
				byteArrayOutputStream.write(buffer, 0, bytesRead);
			}

			// InputStream 닫기
			inputStream.close();

			// 바이트 배열을 Base64 문자열로 변환
			byte[] imageBytes = byteArrayOutputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			return base64Image;
		} catch (Exception e) {
			e.printStackTrace();
			return null; // 오류 발생 시 null 반환
		}
	}
}
