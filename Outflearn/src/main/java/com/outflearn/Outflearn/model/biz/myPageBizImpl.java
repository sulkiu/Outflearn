package com.outflearn.Outflearn.model.biz;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;
import com.outflearn.Outflearn.model.dao.myPageDao;


@Service
public class myPageBizImpl implements myPageBiz {
	
	@Autowired
	private myPageDao dao;

	@Override
	public List<ClassInfoDto> getBasketClass(int user_num) {
		return dao.getBasketClass(user_num);
	}

	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return dao.getSubscribe(user_num);
	}

	@Override
	public List<RoadMapCon> getSubRoadmap(int user_num) {
		return dao.getSubRoadmap(user_num);
	}

	@Override
	public List<QADto> getQA(int user_num) {
		return dao.getQA(user_num);
	}
	
	@Override
	public List<ClassInfoDto> getPreBasketClass(int user_num) {
		return dao.getPreBasketClass(user_num);
	}

	@Override
	public List<ClassInfoDto> getPreSubscribe(int user_num) {
		return dao.getPreSubscribe(user_num);
	}

	@Override
	public List<RoadMapCon> getPreSubRoadmap(int user_num) {
		return dao.getPreSubRoadmap(user_num);
	}

	@Override
	public List<QADto> getPreQA(int user_num) {
		return dao.getPreQA(user_num);
	}
		
}
