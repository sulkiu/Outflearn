package com.outflearn.Outflearn.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.RoadUserCombineDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Repository
public class RoadMapDaoImpl implements RoadMapDao {

	@Inject
	SqlSessionTemplate session;

	// roadmap paege1 작성
	@Override
	public int insertRoadMap(RoadMapInfoDto dto) {

		int res = 0;

		try {
			session.insert(NAMESPACE + "roadmapInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	// 현재 시퀀스 가져오기
	@Override
	public int selectSQ() {
		int seq = 0;
		System.out.println("selectSQ 들어옴");

		try {
			seq = session.selectOne(NAMESPACE + "selectSQ");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return seq;
	}

	// roadmap paege2 작성
	@Override
	public int insertroadNclass(String[] class_num, String seq) {

		System.out.println("insert roadNClassDao입장:::");

		for (String res : class_num) {
			System.out.println(res);
		}

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("seq", seq);

		List<String> staffList = new ArrayList<>();

		for (int i = 0; i < class_num.length; i++) {

			staffList.add(class_num[i]);
		}

		System.out.println("staffLsit" + staffList.size());

		paramMap.put("staffList", staffList);

		return session.insert(NAMESPACE + "roadNclass", paramMap);
	}

	// 주류리스트 뽑기
	@Override
	public List<MainStreamDto> mainStreamList() {

		List<MainStreamDto> list = new ArrayList<MainStreamDto>();

		try {
			list = session.selectList(NAMESPACE + "mainStreamList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 부류리스트 뽑기
	@Override
	public List<SubStreamDto> subStreamList() {

		List<SubStreamDto> list = new ArrayList<SubStreamDto>();

		try {
			list = session.selectList(NAMESPACE + "subStramList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 로드맵 에서 부류로 검색된 class리스트리턴
	//subNum으로 검색
	@Override
	public List<ClassInfoDto> classInfoList(String[] subFilter) {

		// 리턴되는 리스트
		List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();

		// 필터 번호 담을 리스트
		List<String> itemList = new ArrayList<String>();

		for (int i = 0; i < subFilter.length; i++) {
			itemList.add(subFilter[i]);
		}

		// 리스트를 맵에 담아서 넘기기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemList", itemList);

		System.out.println("map" + map);

		try {
			list = session.selectList(NAMESPACE + "classInfoList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	//로드맵 리스트
	@Override
	public List<RoadMapInfoDto> roadMapList() {
		
		List<RoadMapInfoDto> list = new ArrayList<RoadMapInfoDto>();
		
		try {
			list = session.selectList(NAMESPACE+"roadMapList");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public RoadMapInfoDto selectOneRoadMap(String roadNum) {
		
		RoadMapInfoDto dto = new RoadMapInfoDto();
		
		try {
			dto = session.selectOne(NAMESPACE+"selectOneRoadMap", roadNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return dto;
	}

	@Override
	public List<Integer> RoadMapConList(String roadNum) {
		
		List<Integer> list = new ArrayList<Integer>();
		
		try {
		list = session.selectList(NAMESPACE+"roadMapConlist", roadNum);	
		}catch (Exception e) {
	    	e.printStackTrace();	
		}
		
	return list;
	}

	@Override
	public List<ClassInfoDto> RoadClassInfoList(List<Integer> list) {
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("roadClassList", list);
		
		List<ClassInfoDto> resList = new ArrayList<ClassInfoDto>();
		
		try {
			resList = session.selectList(NAMESPACE+"RoadClassInfoList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return resList;
	}

	@Override
	public int roadMapSubscribeInsert(String roadNum, String userNum) {
		
		int res = 0;
		Map<String,String> map = new HashMap<String, String>();
		map.put("userNum",userNum);
		map.put("roadNum",roadNum);		
		
		try {
			res = session.insert(NAMESPACE+"roadMapSubscribeInsert", map);
		}catch (Exception e) {
			e.printStackTrace();
			
		}
			
		return res;
	}

	@Override
	public int updateRoadSubscribe(String roandNum) {
		
		int res=0;
		
		try{
			res = session.update(NAMESPACE+"updateSubscribe", roandNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int roadJoinChk(String roadNum, String userNum) {
		int res = 0;
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("userNum",userNum);
		map.put("roadNum",roadNum);		
		
		try {
			res = session.selectOne(NAMESPACE+"roadJoinChk", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
	
	//페이징, 검색
	@Override
	public List<RoadMapInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search,
			String searchOption) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search);
		map.put("searchOption", searchOption);
		
		List<RoadMapInfoDto> list = session.selectList(NAMESPACE + "selectListPageRoadMap", map);
		
		return list;
	}

	@Override
	public int selectTotalCountRoadMap(String txt_search, String searchOption) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("txt_search", txt_search);
		res = session.selectOne(NAMESPACE + "selectTotalCountRoadMap", map);
		
		return res;
	}

	@Override
	public int roadMapSubscribeDelete(String roadNum, String userNum) {
		int res = 0;
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("userNum",userNum);
		map.put("roadNum",roadNum);			
		
		try {
			res = session.delete(NAMESPACE+"roadMapSubscribeDelete", map);
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		return res;
	}

	@Override
	public int deleteRoadSubscribe(String roadNum) {
		int res = 0;
		
		try {
			res = session.update(NAMESPACE+"deleteSubScribe", roadNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<RoadUserCombineDto> roadMapComList() {
		
		List<RoadUserCombineDto> list = new ArrayList<RoadUserCombineDto>();
		try {
			list = session.selectList(NAMESPACE+"roadComList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public RoadUserCombineDto roadMapComSelectOne(String roadNum) {
		
		RoadUserCombineDto dto = new RoadUserCombineDto();
		
		try {
			dto = session.selectOne(NAMESPACE+"roadComOne", roadNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return dto;
	}

	@Override
	public List<Integer> SubBaList(String userNum) {
		
		List<Integer> list = new ArrayList<Integer>();
		
		try {
			list = session.selectList(NAMESPACE+"SubBaList", userNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int AddToCart(List<String> cartArray, String userNum) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNum", userNum);
		map.put("cartArray", cartArray);	
		
		int res = 0;
		
		try {
			res = session.insert(NAMESPACE+"AddToCart", map);
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		return res;
	}



}
