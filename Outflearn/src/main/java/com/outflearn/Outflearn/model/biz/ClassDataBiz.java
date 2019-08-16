package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;

public interface ClassDataBiz {
	
		// 강좌 데이터 -  CLASS_DATA TABLE
		public List <ClassDataDto> ClassDataSelectList();
		public List<ClassInfoDto> CategorySelectList(String class_category);
		public ClassDataDto ClassDataSelectOne(int class_num);
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
		
		// 강좌 소개 - CLASS_INTRODUCE 테이블
		public List <ClassIntroduceDto> ClassIntroduceSelectList(int class_num);
		public ClassIntroduceDto ClassIntroduceSelectOne(int class_num);
		public int ClassIntroduceInsert(ClassIntroduceDto dto);
		public int ClassInfoUpdate(ClassIntroduceDto dto);
		public int ClassIntroduceDelete(String class_content);
		
		// Live
		public List<LiveDto> liveCalendar();
		public ClassInfoDto livePopup(int live_num);
		public List<ClassInfoDto> getMyClass(int user_num);
		public List<ClassInfoDto> liveRooms(String[] liveRooms);
		
		// MyPage
		public List<ClassInfoDto> getWishList(int user_num);
		public List<ClassInfoDto> getSubscribe(int user_num);
		
		// 댓글 - CLASS_REVIEW 테이블
		public List <ClassReviewDto> ClassReviewSelectList(int class_num);
		public ClassReviewDto ClassReviewSelectOne(int board_no);
		public int ClassReviewInsert(ClassReviewDto dto);
		public int ClassReviewUpdate(ClassReviewDto dto);
		public int ClassReviewDelete(int board_no);
		
		public int ClassReviewAnswer(ClassReviewDto dto, int parentBoard_no);
	
		//페이징
		public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search );
		public int selectTotalCount(String txt_search);
		public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search , String searchOption);
		public int selectTotalCount(String searchOption, String txt_search);
}
