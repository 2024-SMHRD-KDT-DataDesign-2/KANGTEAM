package com.smhrd.data_at;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.compress.archivers.zip.ZipFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.data;
import com.smhrd.mapper.loadMapper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

@Controller
public class loadController {
	@Autowired
	private loadMapper loadmapper;

	@RequestMapping(value ="/upload",method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("imgfile") MultipartFile[] files) {
		System.out.println("File upload initiated.");
		String uploadPath = "C:/uploads/"; // 파일 저장 경로

		File dir = new File(uploadPath);
		if (!dir.exists()) {
			dir.mkdirs(); // 경로가 없으면 생성
		}

		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				System.out.println("Received file: " + file.getOriginalFilename());

				// ZIP 파일인지 확인
				if (file.getOriginalFilename().endsWith(".zip")) {
					try {
						File tempZipFile = new File(uploadPath, UUID.randomUUID().toString() + ".zip");
						file.transferTo(tempZipFile); // 파일을 임시 경로에 저장
						unzip(tempZipFile.getAbsolutePath(), uploadPath); // 압축 해제
						tempZipFile.delete(); // 임시 ZIP 파일 삭제
					} catch (IOException e) {
						e.printStackTrace();
						return "ZIP 파일 업로드 실패: " + e.getMessage();
					}
				} else {
					// ZIP 파일이 아닌 일반 파일 처리
					String uuid = UUID.randomUUID().toString();
					String fileExtension = getFileExtension(file.getOriginalFilename());
					String newFileName = uuid + fileExtension;

					try {
						file.transferTo(new File(uploadPath + newFileName));
						System.out.println("File saved: " + newFileName);
					} catch (IOException e) {
						e.printStackTrace();
						return "파일 업로드 실패: " + e.getMessage();
					}
				}
			}
		}

		return "파일 업로드 성공";
	}

	// Apache Commons Compress를 사용한 ZIP 파일 압축 해제 메서드
	private void unzip(String zipFilePath, String destDir) throws IOException {
		System.out.println("Starting to unzip file.");
		File destDirFile = new File(destDir);
		if (!destDirFile.exists()) {
			destDirFile.mkdirs();
		}

		try (ZipFile zipFile = new ZipFile(new File(zipFilePath), "UTF-8")) { // UTF-8 문자셋 사용
			Enumeration<ZipArchiveEntry> entries = zipFile.getEntries();
			while (entries.hasMoreElements()) {
				ZipArchiveEntry entry = entries.nextElement();
				String entryName = entry.getName();
				System.out.println("Processing entry: " + entryName);

				// 경로 탈출 방지
				if (entryName.contains("..")) {
					throw new IOException("Invalid entry name: " + entryName);
				}

				// UUID로 파일 이름 변경
				String newFileName = UUID.randomUUID().toString();
				String fileExtension = getFileExtension(entryName); // 원본 확장자 유지
				newFileName = newFileName + fileExtension;

				File newFile = new File(destDir + File.separator + newFileName);
				if (entry.isDirectory()) {
					newFile.mkdirs();
					System.out.println("Directory created: " + newFile.getAbsolutePath());
				} else {
					File parent = newFile.getParentFile();
					if (!parent.exists()) {
						parent.mkdirs();
					}
					try (InputStream inputStream = zipFile.getInputStream(entry);
							FileOutputStream outputStream = new FileOutputStream(newFile)) {
						byte[] buffer = new byte[1024];
						int len;
						while ((len = inputStream.read(buffer)) > 0) {
							outputStream.write(buffer, 0, len);
						}
						System.out.println("File created: " + newFile.getAbsolutePath());
					}
				}
			}
		} catch (IOException e) {
			System.err.println("Error occurred during unzipping: " + e.getMessage());
			throw e;
		}
	}

	// Windows에서 허용되지 않는 문자를 대체하는 메서드
	private String sanitizeFileName(String fileName) {
		// Windows에서 허용되지 않는 문자: \ / : * ? " < > |
		return fileName.replaceAll("[\\\\/:*?\"<>|]", "_");
	}

	// 파일 확장자 추출 메서드
	private String getFileExtension(String fileName) {
		if (fileName != null && fileName.lastIndexOf(".") > 0) {
			return fileName.substring(fileName.lastIndexOf("."));
		}
		return ""; // 확장자가 없으면 빈 문자열 반환
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void downloadImages(HttpServletResponse response, @RequestParam("user_id") String user_id,
			@RequestParam("created_at") String created_at) throws IOException {
		// 이미지 URL 목록 (예시)
		ArrayList<String> imageUrls = new ArrayList<String>();

		data d = new data();

		d.setUser_id(user_id);
		d.setCreated_at(created_at);

		List<String> list = loadmapper.urlSelect(d);

		for (String s : list) {
			imageUrls.add(s);
		}

		// ZIP 파일 이름 설정
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
			// URL에서 파일 이름 추출
			String originalFileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);

			// 파일 이름에서 확장자를 제거하고 .png로 설정
			String fileNameWithoutExtension = originalFileName.split("\\.")[0]; // 확장자 제거
			String newFileName = fileNameWithoutExtension + ".png"; // 새로운 파일 이름 생성

			// ZIP 파일에 이미지 추가
			ZipArchiveEntry zipEntry = new ZipArchiveEntry(newFileName);
			zos.putArchiveEntry(zipEntry);

			// 이미지 내용을 ZIP 파일에 쓰기
			byte[] buffer = new byte[1024];
			int length;
			while ((length = in.read(buffer)) >= 0) {
				zos.write(buffer, 0, length);
			}
			zos.closeArchiveEntry();
		}
	}
}
