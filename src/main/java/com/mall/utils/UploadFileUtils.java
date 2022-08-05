package com.mall.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
		
	static final int THUMB_WIDTH = 300;  // 썸네일의 가로 크기
	static final int THUMB_HEIGHT = 300;  // 썸네일의 세로 크기
	
	public static String fileUpload(String uploadPath,
									String fileName, 
									byte[] fileData) throws Exception {

		// 랜덤문자 생성
		UUID uid = UUID.randomUUID();
		
		String newFileName = uid + "_" + fileName;  // "랜덤문자_파일명"
		String imgPath = uploadPath;  // 업로드 경로 = 이미지 저장 경로

		// 이미지 저장 경로에 원본 파일을 저장
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);
		
		String thumbFileName = "s_" + newFileName;  // 썸네일 파일명 = "s_파일명"
		File image = new File(imgPath + File.separator + newFileName);

		// 원본 파일과 같은 경로의 하위에 "s" 폴더를 생성하여 썸네일을 저장
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			
			// 썸네일이 저장될 폴더를 생성
			thumbnail.getParentFile().mkdirs();
			
			// 썸네일 생성
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}

	private static void makeDir(String uploadPath, String... paths) {

		// 폴더가 존재하는지 확인. 폴더가 존재하면 그대로 종료
		if (new File(paths[paths.length - 1]).exists()) { return; }

		// 폴더가 존재하지 않다면, 폴더를 생성
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}