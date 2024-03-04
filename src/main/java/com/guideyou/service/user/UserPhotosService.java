/**
 * 
 */
package com.guideyou.service.user;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.guideyou.dto.user.photos.UserPhotosDTO;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.entity.user.UserPhotos;
import com.guideyou.repository.interfaces.user.UserPhotosRepository;
import com.guideyou.utils.Define;

/**
  * @FileName : UserPhotosService.java
  * @Project : GuideYou
  * @Date : 2024. 3. 4. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 :
  */
@Service
public class UserPhotosService {
	@Autowired
	private UserPhotosRepository userPhotosRepository;

	/**
	  * @Method Name : saveUserPhotos
	  * @작성일 : 2024. 3. 4.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 프로필 사진 저장
	  * @param saveUserPhotos
	  * @param file
	  */
	public int saveUserPhotos(User profileUpdateUser, MultipartFile inputFile) {
		int result = 0;
		UserPhotos updateUserPhoto = userPhotosRepository.findByUserId(profileUpdateUser.getId());
		MultipartFile file = inputFile;
		if (file.isEmpty() == false) {
			// 사용자가 이미지를 업루드 했다면 기능 구현
			// 파일 사이즈 체크
			// 20MB
			if (file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestfulException("파일 크기는 20MB 이상 클 수 없습니다", HttpStatus.BAD_REQUEST);
			}

			// 서버 컴퓨터에 파일 넣을 디렉토리가 있는지 검사
			String filePath = Define.UPLOAD_FILE_DERECTORY;
			// 폴더가 없다면 오류 발생(파일 생성시)
			File dir = new File(filePath);
			if (dir.exists() == false) {
				System.out.println("이거 타야하잖아1");
				dir.mkdirs(); // 폴더가 없스면 폴더 생성
			}

			// 파일 이름 (중복 처리 예방)
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();

			String uploadPath = filePath + File.separator + fileName;
			File destination = new File(uploadPath);

			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

	        UserPhotos userPhotosDTO = UserPhotos.builder()
					.userId(profileUpdateUser.getId())
					.profilePhoto(filePath)
					.originFileName(file.getOriginalFilename())
					.uploadFileName(fileName)
					.build();
	        if(updateUserPhoto == null) {
	        	result = userPhotosRepository.insert(userPhotosDTO);
	        	if(result == 0) {
	        		throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
	        	}
	        } else {
	        	userPhotosDTO.setId(updateUserPhoto.getId());
	        	result = userPhotosRepository.updateById(userPhotosDTO);
	        	if(result == 0) {
	        		throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
	        	}
	        }
		}
		return result;	
	}
	
	/**
	  * @Method Name : readByUserId
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 ID로 사용자 사진 조회
	  * @param userId
	  * @return
	  */
	public UserPhotos readByUserId(Integer userId) {
		UserPhotos userPhotosDTO = userPhotosRepository.findByUserId(userId);
		return userPhotosDTO;
	}
}
