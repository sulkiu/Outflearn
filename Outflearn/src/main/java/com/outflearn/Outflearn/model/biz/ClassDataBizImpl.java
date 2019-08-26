package com.outflearn.Outflearn.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassCategoryDto;
import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.SubStreamDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;


@Service
public class ClassDataBizImpl implements ClassDataBiz {
	
	@Autowired
	private ClassDataDao dao;



//	--------------------------------------------------- 강좌 정보(CLASS_INFO)
	public List<ClassInfoDto> ClassInfoSelectList() {
		
		return dao.ClassInfoSelectList();
	}
	
	@Override
	public List<ClassInfoDto> CategorySelectList(String class_category) {
		return dao.CategorySelectList(class_category);
	}
	
	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {
		
		return dao.ClassInfoSelectOne(class_num);
	}
	
	@Override
	public List<ClassInfoDto> classInfoSelectListUser(int user_num) {
		
		return dao.classInfoSelectListUser(user_num);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoInsert(dto);
	}
	
	@Override
	public List<ClassInfoDto> ClassSubName(int sub_num) {
		System.out.println("비즈오니?");
		return dao.ClassSubName(sub_num);
	}


//	---------------------------------------------------	강좌 소개(CLASS_INTRODUCE)
	@Override
	public ClassIntroduceDto ClassIntroduceSelectList(int class_num) {
		
		return dao.ClassIntroduceSelectList(class_num);
	}
	

	@Override
	public int ClassIntroduceInsert(ClassIntroduceDto dto) {
		
		return dao.ClassIntroduceInsert(dto);
	}
	
//	--------------------------------------------------- 강좌 데이터(CLASS_DATA)
	
	@Override
	public ClassIntroduceDto ClassIntroduceSelectOne(int class_num) {

		return dao.ClassIntroduceSelectOne(class_num);
	}
	
	@Override
	public List<ClassDataDto> ClassDataSelectOne(int class_num) {
	
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
	public int ClassInfoUpdateSub(int class_num) {
		
		return dao.ClassInfoUpdateSub(class_num);
	}
//	-------------------------------------------------장바구니(BASKET)
	@Override
	public int classBasketInsert(ClassInfoDto dto) {
	
		return dao.classBasketInsert(dto);
	}

	@Override
	public int classBasketDelete(int class_num) {
		
		return dao.classBasketDelete(class_num);
	}
	
//	--------------------------------------------------- 댓글
	@Override
	public List<ClassReviewDto> ClassReviewSelectList(int class_num) {
	
		return dao.ClassReviewSelectList(class_num);
	}

	@Override
	public ClassReviewDto ClassReviewSelectOne(int review_num) {

		return dao.ClassReviewSelectOne(review_num);
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
	public int ClassReviewDelete(int review_num) {
		
		return dao.ClassReviewDelete(review_num);
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

	

	@Override
	public int ClassReviewInsertAnswer(ClassReviewDto dto) {
		return dao.ClassReviewInsertAnswer(dto);
	}

	@Override
	public List<ClassDataDto> ClassDataSelectList() {
		return dao.ClassDataSelectList();
	}
//-----------------------------------------------------페이징 및 리스트 불러오기	
	@Override
	public int selectTotalCount(String txt_search) {
		return dao.selectTotalCount(txt_search);
	}
	@Override
	public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search) {
		return dao.selectListPage(firstIndex, recordCountPerPage, txt_search);
	}
	
	@Override
	public List<ClassInfoDto> selectListPageTwo(int firstIndex, int recordCountPerPage, String txt_search, String searchOption) {
		return dao.selectListPageTwo(firstIndex, recordCountPerPage, txt_search, searchOption);
	}
	@Override
	public int selectTotalCountTwo(String txt_search, String searchOption) {
		return dao.selectTotalCountTwo(txt_search, searchOption);
	}
	@Override
	public List<QADto> QASelectList(int class_num) {
		return dao.QASelectList(class_num);
	}
	
	@Override
	public List<SubStreamDto> MainStreamSelectOne(int main_num) {
	
		return dao.MainStreamSelectOne(main_num);
	}
	
	@Override
	public int ClassCategoryInsert(int main_num, int sub_num) {
	
		return dao.ClassCategoryInsert(main_num, sub_num);
	}
		
	public QADto QASelectOne(int qa_num) {
		return dao.QASelectOne(qa_num);
	}
	
	@Override
	public List<QADto> QAReply(int qa_group_no) {
		return dao.QAReply(qa_group_no);
	}
	
	@Override
	public int QAInsert(QADto dto) {
		return dao.QAInsert(dto);
	}

	@Override
	public int QAReplyInsert(QADto dto) {
		return dao.QAReplyInsert(dto);
	}
	
	@Override
	public int QAReplyUpdate(QADto dto) {
		return dao.QAReplyUpdate(dto);
	}
	// 구독

	@Override
	public int classInsertSubscribe(int user_num, int class_num) {
	
		return dao.classInsertSubscribe(user_num, class_num);
	}

	@Override
	public List<ClassInfoDto> SubCountSelectList() {
		return dao.SubCountSelectList();
	}

	@Override
	public List<ClassInfoDto> PopularReviewSelectList() {
		return dao.PopularReviewSelectList();
	}

	@Override
	public int QADelete(int qa_group_no) {
		return dao.QADelete(qa_group_no);
	}

	@Override
	public int QAReplyDelete(QADto dto) {
		return dao.QAReplyDelete(dto);
	}
}
