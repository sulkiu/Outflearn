package com.outflearn.Outflearn.model.dao;

import java.util.List;


import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;

public interface ClassDataDao {
	
	String namespace = "data.";
	
	// 강좌 데이터 -  CLASS_DATA TABLE
	public List <ClassDataDto> ClassDataSelectList();
	public ClassDataDto ClassDataSelectOne(int data_chapter);
	public int ClassDataInsert(ClassDataDto dto);
	public int ClassChapterDataInsert(ClassDataDto dto);
	public int ClassDataUpdate(ClassDataDto dto);
	public int ClassDataDelete(String data_subhead);
	
	// 강좌 정보  - CLASS_INFO 테이블
	public List <ClassInfoDto> ClassInfoSelectList();
	public ClassInfoDto ClassInfoSelectOne(int class_num);
	public int ClassInfoInsert(ClassInfoDto dto);
	public int ClassInfoUpdate(ClassInfoDto dto);
	public int ClassInfoDelete(String class_title);
	
	
}