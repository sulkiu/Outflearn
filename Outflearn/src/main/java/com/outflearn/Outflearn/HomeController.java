package com.outflearn.Outflearn;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;
import com.outflearn.Outflearn.service.KakaoRestapi;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	public ClassDataBiz biz;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home() {

		return "home";
	}

	@RequestMapping(value = "home")
	public String tohome() {

		return "home";
	}

	@RequestMapping("/LectureList")
	public String LectureList(Model model) {

		model.addAttribute("classinfo", biz.ClassInfoSelectList());

		return "LectureList";
	}

	@RequestMapping("/LectureDetail")
	public String LectureDetail(@ModelAttribute ClassInfoDto dto, Model model, HttpSession session) {

		model.addAttribute("classinfo", biz.ClassInfoSelectOne(dto.getClass_num()));
		session.setAttribute("info_num", dto.getClass_num());

		return "LectureDetail";
	}

	@RequestMapping("DetailDashBoard")
	@ResponseBody
	public String DetailDashBoard(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");
		System.out.println("변환하지 않은 거 :" + session.getAttribute("info_num"));
		System.out.println("변환한 것 : " + info_num);

		ClassDataDto dto = biz.ClassDataSelectOne(info_num);
		System.out.println("controller : " + dto.toString());

		return dto.getData_data();
	}

	@RequestMapping("Livepage")
	public void Livepage() {

	}

	@RequestMapping("ClassInfoInsertForm")
	public void ClassInfoInsertForm() {
		logger.info("ClassInfoInsertForm");
		System.out.print("여기는 왔어");
	}

//	ClassInfoInsertForm.jsp - > ClassIntroduceInsertForm.jsp  CLASS_DATA DB 저장
	@RequestMapping("ClassIntroduceInsertForm")
	public String ClassIntroduceInsertForm(@ModelAttribute ClassInfoDto dto) {
		logger.info("ClassIntroduceInsertForm");

		int res = biz.ClassInfoInsert(dto);

		if (res > 0) {
			return "ClassIntroduceInsertForm";
		} else {

			return "redirect: ClassIntroduceInsertForm";
		}
	}

//	ClassIntroduceInsertForm.jsp - > DataVideoUploadForm.jsp  CLASS_INTRODUCE DB 저장
	@RequestMapping("DataVideoUploadForm")
	public String DataVideoUploadForm(@ModelAttribute ClassIntroduceDto dto) {
		logger.info("DataVideoUploadForm");

		int res = biz.ClassIntroduceInsert(dto);

		if (res > 0) {
			return "DataVideoUploadForm";
		} else {

			return "redirect: ClassInfoInsertForm";
		}
	}

// 	영상소개 작성 확인 DataVideoUploadForm.jsp
	@RequestMapping("DataVideoUpload")
	public String DataVideoUpload(@ModelAttribute ClassDataDto dto) {
		logger.info("DataVideoUpload");

		int res = 0;

		String a = dto.getData_youtube();
		String b = "";
		if (a.contains("v=")) {
			b = a.split("v=")[1];
		} else if (a.contains("list=")) {
			b = a.split("list=")[1];
		}

		dto.setData_data(b);

		res = biz.ClassDataInsert(dto);

		if (res > 0) {
			return "DataVideoUploadFormPlus";
		} else {
			return "redirect: DataVideoUploadForm";
		}

	}

//  유튜브 링크영상말고 직접 영상 업로드 팝업창 이동
	@RequestMapping("SelfDataVideoUpload")
	public void SelfDataVideoUpload() {

	}

//	직접 영상 업로드 팝업창 파일 받아옴
	@RequestMapping("ClassUpload")
	public String ClassUpload(@ModelAttribute ClassDataDto dto, HttpSession session) {

		System.out.println("11111111111111 " + dto.getData_chapter());
		int res = biz.ClassDataUpdate(dto);
		session.setAttribute("data_youtube", dto.getData_chapter());
		System.out.println("2222222222222" + dto.getData_chapter());
		return "home";
	}

//	챕터 추가
	@RequestMapping("DataVideoUploadFormPlus")
	public void DataVideoUploadFormPlus() {

	}

//	영상 소개페이지에서 
	@RequestMapping("DataVideoUploadPlus")
	public String DataVideoUploadPlus(@ModelAttribute ClassDataDto dto, HttpSession session, Model model) {

		int res = 0;

		String a = dto.getData_youtube();
		String b = "";
		if (a.contains("v=")) {
			b = a.split("v=")[1];
		} else if (a.contains("list=")) {
			b = a.split("list=")[1];
		}

		dto.setData_data(b);

		res = biz.ClassChapterDataInsert(dto);

		model.addAttribute("classdata", biz.ClassDataSelectList());

		if (res > 0) {
			return "redirect: DataVideoUploadFormPlus";
		} else {
			return "redirect: DataVideoUploadForm";
		}

	}

	@RequestMapping("BackDataVideoUploadForm")
	public String BackDataVideoUploadForm(@ModelAttribute ClassDataDto dto, Model model) {

		return "BackDataVideoUploadForm";
	}

	@RequestMapping("LectureDetailView")
	public String LectureDetailView(String DATA_DATA, Model model) {

		model.addAttribute("DATA_DATA", DATA_DATA);

		return "LectureDetailView";
	}

	@RequestMapping("LecturePlayList")
	@ResponseBody
	public String LecturePlayList(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		ClassDataDto data_dto = biz.ClassDataSelectOne(info_num);
		model.addAttribute("info_dto", biz.ClassInfoSelectOne(info_num));

		return data_dto.getData_data();
	}

	@RequestMapping("introOutflearn")
	public void introOutflearn() {

	}

// Live
	@RequestMapping("liveCalendar")
	@ResponseBody
	public List<LiveDto> liveCalendar() {

		return biz.liveCalendar();
	}

	@RequestMapping("livePopup")
	@ResponseBody
	public ClassInfoDto livePopup(int live_num) {
		return biz.livePopup(live_num);
	}

	@RequestMapping("casterRoom")
	public void casterRoom() {
	}

	@RequestMapping("getMyClass")
	public List<ClassInfoDto> getMyClass(Authentication auth) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return biz.getMyClass(dto.getUser_num());
	}
	
	
	

// myPage
	@RequestMapping("myPage")
	public String myPage(Model model, Authentication auth) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		model.addAttribute("userInfo", dto);
		model.addAttribute("wishList", biz.getWishList(dto.getUser_num()));
		model.addAttribute("subClass", biz.getSubscribe(dto.getUser_num()));
		
		return "myPage";
	}

}
