package com.outflearn.Outflearn.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;


@Service
public class ClassDataBizImpl implements ClassDataBiz {
	
	@Autowired
	private ClassDataDao dao;

//	--------------------------------------------------- 강좌 데이터
	@Override
	public List<ClassDataDto> ClassDataSelectList() {
		
		return dao.ClassDataSelectList();
	}

	@Override
	public ClassDataDto ClassDataSelectOne(int class_num) {
		
		return dao.ClassDataSelectOne(class_num);
	}

	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		
		return dao.ClassDataInsert(dto);
	}
	
	
	@Override
	public int ClassChapterDataInsert(ClassDataDto dto) {
		
		return dao.ClassChapterDataInsert(dto);
	}
	

	@Override
	public int ClassDataUpdate(ClassDataDto dto) {
		
		return dao.ClassDataUpdate(dto);
	}

	@Override
	public int ClassDataDelete(String data_subhead) {
		
		return dao.ClassDataDelete(data_subhead);
	}

//	--------------------------------------------------- 강좌 정보
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {
		
		return dao.ClassInfoSelectList();
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {
		
		return dao.ClassInfoSelectOne(class_num);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoInsert(dto);
	}

	@Override
	public int ClassInfoUpdate(ClassInfoDto dto) {
		
		return dao.ClassInfoUpdate(dto);
	}

	@Override
	public int ClassInfoDelete(String class_title) {
		
		return dao.ClassInfoDelete(class_title);
	}
	
//	---------------------------------------------------	강좌 소개
	@Override
	public List<ClassIntroduceDto> ClassIntroduceSelectList(int class_num) {
		
		return dao.ClassIntroduceSelectList(class_num);
	}

	@Override
	public ClassIntroduceDto ClassIntroduceSelectOne(int class_num) {

		return dao.ClassIntroduceSelectOne(class_num);
	}

	@Override
	public int ClassIntroduceInsert(ClassIntroduceDto dto) {
	
		return dao.ClassIntroduceInsert(dto);
	}

	@Override
	public int ClassInfoUpdate(ClassIntroduceDto dto) {

		return 0;
	}

	@Override
	public int ClassIntroduceDelete(String class_content) {

		return 0;
	}


// ---------------------------------------------------	Live
	@Override
	public List<LiveDto> liveCalendar() {
		return dao.liveCalendar();
	}

	@Override
	public ClassInfoDto livePopup(int live_num) {
		return dao.livePopup(live_num);
	}

	@Override
	public List<ClassInfoDto> getMyClass(int user_num) {
		return dao.getMyClass(user_num);
	}

	@Override
	public List<ClassInfoDto> getWishList(int user_num) {
		return dao.getWishList(user_num);
	}

	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return dao.getSubscribe(user_num);
	}
//	--------------------------------------------------- 댓글
	@Override
	public List<ClassReviewDto> ClassReviewSelectList(int class_num) {
	
		return dao.ClassReviewSelectList(class_num);
	}

	@Override
	public ClassReviewDto ClassReviewSelectOne(int board_no) {

		return dao.ClassReviewSelectOne(board_no);
	}

	@Override
	public int ClassReviewInsert(ClassReviewDto dto) {
		
		return dao.ClassReviewInsert(dto);
	}

	@Override
	public int ClassReviewUpdate(ClassReviewDto dto) {
	
		return dao.ClassReviewUpdate(dto);
	}

	@Override
	public int ClassReviewDelete(int board_no) {
		
		return dao.ClassReviewDelete(board_no);
	}

	@Override
	public int ClassReviewAnswer(ClassReviewDto dto, int parentBoard_no) {
		int parentboard_no = dto.getReview_num();
		
		  // update
	      int ClassReviewUpdateAnswer = dao.ClassReviewUpdateAnswer(parentboard_no);
	      
	      // insert
	      int ClassReviewInsertAnswer = dao.ClassReviewInsertAnswer(dto);
		
		return (ClassReviewUpdateAnswer + ClassReviewInsertAnswer);
	}

		
}
