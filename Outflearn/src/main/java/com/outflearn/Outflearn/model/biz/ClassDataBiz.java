package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassUploadDto;

public interface ClassDataBiz {
	
	// 강좌 데이터 -  CLASS_DATA TABLE
		public List <ClassDataDto> ClassDataSelectList();
		public ClassDataDto ClassDataSelectOne(int class_num);
		public int ClassDataInsert(ClassDataDto dto);
		public int ClassDataUpdate(ClassDataDto dto);
		public int ClassDataDelete(String data_subhead);
		
		// 강좌 정보  - CLASS_INFO 테이블
		public List <ClassInfoDto> ClassInfoSelectList();
		public ClassInfoDto ClassInfoSelectOne(int class_num);
		public int ClassInfoInsert(ClassInfoDto dto);
		public int ClassInfoUpdate(ClassInfoDto dto);
		public int ClassInfoDelete(String class_title);
		
		// 강좌 영상올리기 - CLASS_UPLOAD 테이블 
		public List <ClassUploadDto> ClassUploadSelectList();
		public ClassInfoDto ClassUploadSelectOne(int class_num);
		public int ClassUploadInsert(ClassUploadDto dto);
		public int ClassUploadUpdate(ClassUploadDto dto);
		public int ClassUploadDelete(int class_num);
	
	
}