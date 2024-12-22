package com.smhrd.data_at;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.data;
import com.smhrd.entity.load;
import com.smhrd.mapper.loadMapper;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.*;

import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

@Controller
public class loadController {
	@Autowired
	private loadMapper loadmapper;
	@Autowired
	private classifyController classifyController; // classifyController 주입

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("imgfile") MultipartFile[] files,
			@RequestParam("class") String classes, @RequestParam("img_content") String img_content,
			@RequestParam("img_title") String img_title, HttpSession session) {
		ArrayList<String> imgUrls = new ArrayList<>();
		ArrayList<String> uuids = new ArrayList<>();
		ArrayList<Long> size = new ArrayList<>() ;
		String uploadPath = System.getProperty("user.home") + "/Documents/";

		for (MultipartFile file : files) {
			try {
				if (!file.isEmpty()) {
					if (file.getOriginalFilename().endsWith(".zip")) {
						// ZIP 파일 처리
						System.out.println("Processing ZIP file: " + file.getOriginalFilename());
						List<File> extractedFiles = unzipFile(file, uploadPath);
						for (File extractedFile : extractedFiles) {
							String uuid = UUID.randomUUID().toString() + getFileExtension(extractedFile.getName());
							uuids.add(uuid);
							File tempFile = new File(uploadPath + uuid);
							Files.copy(extractedFile.toPath(), tempFile.toPath()); // 복사 후 업로드
							size.add(file.getSize()) ;
							uploadImageFile(tempFile, imgUrls, uuid);
							tempFile.delete(); // 임시 파일 삭제
						}
					} else {
						// 일반 파일 처리
						String uuid = UUID.randomUUID().toString() + getFileExtension(file.getOriginalFilename());
						uuids.add(uuid);
						File tempFile = new File(uploadPath + uuid);
						file.transferTo(tempFile);
						size.add(file.getSize()) ;
						uploadImageFile(tempFile, imgUrls, uuid);
						tempFile.delete(); // 임시 파일 삭제
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// classify 호출 및 detect 처리
		String uuidsParam = String.join(",", uuids);
		String imgUrlsParam = String.join(",", imgUrls);
		
		String str = classes.replaceAll(",$", "");

		Map<String, String> requestBody = new HashMap<>();
		requestBody.put("classes", str);
		requestBody.put("img_url", imgUrlsParam);

		ResponseEntity<Map<String, Object>> classifyResponse = classifyController.classify(session, requestBody);

		if (session.getAttribute("req") != null) {
			session.removeAttribute("req");
		}

		// classify 결과를 세션에 저장
		load req = new load();
		
		req.setImg_size(size) ;
		req.setImg_url(imgUrlsParam);
		req.setImg_idx(uuidsParam);
		req.setClasses(classes);
		req.setImg_title(img_title) ;
		req.setImg_content(img_content) ;
		
		session.setAttribute("req", req);
		session.setAttribute("classifyResult", classifyResponse.getBody());

		return "redirect:/home";
	}

	private void uploadImageFile(File file, ArrayList<String> imgUrls, String uuid) {
		try {
			// Base64로 이미지 인코딩
			byte[] imageBytes = java.nio.file.Files.readAllBytes(file.toPath());
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			// HTTP Client 생성
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost postRequest = new HttpPost("http://112.217.124.195:30010/upload");
			postRequest.addHeader("Content-Type", "application/json");

			// JSON Body 생성
			String jsonBody = String.format("{\"image\": \"%s\", \"filename\": \"%s\"}", base64Image, uuid);
			postRequest.setEntity(new StringEntity(jsonBody));

			// POST 요청 실행
			HttpResponse response = client.execute(postRequest);

			// 응답 확인
			if (response.getStatusLine().getStatusCode() == 200) {
				// JSON 응답 파싱
				ResponseHandler<String> handler = new BasicResponseHandler();
				String responseBody = handler.handleResponse(response);
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> jsonResponse = objectMapper.readValue(responseBody, Map.class);

				// URL 가져오기
				if (jsonResponse.containsKey("url")) {
					String uploadedImageUrl = (String) jsonResponse.get("url");
					// URL의 /images/를 /download/로 변경
					uploadedImageUrl = uploadedImageUrl.replace("/images/", "/download/");
					imgUrls.add(uploadedImageUrl);
					System.out.println("Image uploaded successfully: " + uploadedImageUrl);
				} else {
					System.err.println("No URL returned from the server.");
				}
			} else {
				System.err.println("Upload failed: HTTP " + response.getStatusLine().getStatusCode());
			}
			client.close();
		} catch (Exception e) {
			System.err.println("Error uploading file: " + e.getMessage());
			e.printStackTrace();
		}
	}

	private boolean isImageAccessible(String imageUrl, int retries, int delayMillis) {
		for (int i = 0; i < retries; i++) {
			try {
				HttpURLConnection connection = (HttpURLConnection) new URL(imageUrl).openConnection();
				connection.setRequestMethod("HEAD");
				if (connection.getResponseCode() == 200) {
					System.out.println("Image is accessible: " + imageUrl);
					return true;
				}
			} catch (IOException e) {
				System.err.println("Retry " + (i + 1) + ": Unable to access image " + imageUrl);
			}
			try {
				Thread.sleep(delayMillis);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	private String getFileExtension(String fileName) {
		if (fileName != null && fileName.lastIndexOf(".") > 0) {
			return fileName.substring(fileName.lastIndexOf("."));
		}
		return "";
	}

	@RequestMapping(value = "/zipdownload", method = RequestMethod.POST)
	public void downloadImages(HttpServletResponse response, @RequestParam("img_id") String img_id) throws IOException {
		List<String> imageUrls = new ArrayList<>();

		List<String> list = loadmapper.urlSelect(img_id);
		
		System.out.println(list.toString());
		
		imageUrls.addAll(list);

		// ZIP 파일 설정
		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment; filename=\"images.zip\"");

		try (ZipArchiveOutputStream zos = new ZipArchiveOutputStream(response.getOutputStream())) {
			for (String imageUrl : imageUrls) {
				downloadAndZipImage(imageUrl, zos);
			}
		}
	}

	private void downloadAndZipImage(String imageUrl, ZipArchiveOutputStream zos) throws IOException {
		URL url = new URL(imageUrl);
		try (InputStream in = url.openStream()) {
			String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
			ZipArchiveEntry zipEntry = new ZipArchiveEntry(fileName);
			zos.putArchiveEntry(zipEntry);

			byte[] buffer = new byte[1024];
			int length;
			while ((length = in.read(buffer)) >= 0) {
				zos.write(buffer, 0, length);
			}
			zos.closeArchiveEntry();
		}
	}

	private List<File> unzipFile(MultipartFile zipFile, String destinationFolder) throws IOException {
		List<File> extractedFiles = new ArrayList<>();
		File destDir = new File(destinationFolder);

		if (!destDir.exists()) {
			destDir.mkdirs(); // 폴더가 없으면 생성
		}

		// ZIP 파일 저장
		File tempZipFile = File.createTempFile("upload", ".zip");
		zipFile.transferTo(tempZipFile);

		boolean success = false;

		try {
			// UTF-8로 시도
			success = unzipWithEncoding(tempZipFile, destDir, "UTF-8", extractedFiles);
		} catch (Exception e) {
			System.err.println("UTF-8 decoding failed: " + e.getMessage());
			System.out.println("Retrying with CP437 encoding...");
			try {
				// CP437로 재시도
				success = unzipWithEncoding(tempZipFile, destDir, "CP437", extractedFiles);
			} catch (Exception ex) {
				System.err.println("CP437 decoding also failed: " + ex.getMessage());
				throw new IOException("Failed to extract ZIP file due to encoding issues.", ex);
			}
		} finally {
			tempZipFile.delete(); // 임시 파일 삭제
		}

		if (!success) {
			throw new IOException("Failed to unzip file due to encoding issues.");
		}

		return extractedFiles;
	}

	private boolean unzipWithEncoding(File zipFile, File destDir, String encoding, List<File> extractedFiles)
			throws IOException {
		try (ZipFile zip = new ZipFile(zipFile, java.nio.charset.Charset.forName(encoding))) {
			Enumeration<? extends ZipEntry> entries = zip.entries();
			while (entries.hasMoreElements()) {
				ZipEntry entry = entries.nextElement();
				if (!entry.isDirectory()) {
					String uniqueFileName = UUID.randomUUID().toString();
					String extension = entry.getName().contains(".")
							? entry.getName().substring(entry.getName().lastIndexOf("."))
							: "";
					File extractedFile = new File(destDir, uniqueFileName + extension);

					// 파일 내용 복사
					try (InputStream is = zip.getInputStream(entry);
							FileOutputStream fos = new FileOutputStream(extractedFile)) {
						byte[] buffer = new byte[1024];
						int len;
						while ((len = is.read(buffer)) > 0) {
							fos.write(buffer, 0, len);
						}
					}
					extractedFiles.add(extractedFile);
					System.out.println("Extracted file: " + extractedFile.getAbsolutePath());
				}
			}
			return true;
		} catch (IOException e) {
			throw new IOException("Error while extracting ZIP file with encoding " + encoding, e);
		}
	}

}
