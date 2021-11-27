package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lee.app.common.Paging;

import model.diet.DietPaging;
import model.diet.DietService;
import model.diet.DietVO;
import model.userInfo.UserInfoVO;

@Controller
public class DietController {

	@Autowired
	private DietService dietService;

	private HttpSession session;

	@RequestMapping("/insertDiet.do")
	public String insertDiet(DietVO vo, HttpServletRequest request) {

		System.out.println("insertDiet 컨트롤러옴!");
		// System.out.println(vo);

		// Date date = vo.getDdate();
		// System.out.println(vo.getDdate());

		// 하루 총 칼로리 셋지정
		vo.setDayCalorie(
				vo.getBreakfastCalorie() + vo.getLunchCalorie() + vo.getDinerCalorie() + vo.getAnotherCalorie());

		dietService.insertDiet(vo);

		return "redirect:main.do";
	}

	
	@RequestMapping("/updateDiet.do")
	public String updateDiet(DietVO vo) {
		System.out.println("updateDiet 컨트롤러옴!");
		
		vo.setDayCalorie(vo.getBreakfastCalorie()+vo.getLunchCalorie()+vo.getDinerCalorie()+vo.getAnotherCalorie());
		System.out.println(vo);
		dietService.updateDiet(vo);

		return "redirect:getDietData.do?dnum="+vo.getDnum();
	}

	@RequestMapping("/deleteDiet.do")
	public String deleteDiet(DietVO vo) {
		System.out.println("deleteDiet 컨트롤러옴!");

		dietService.deleteDiet(vo);

		return "redirect:dietList.do";
	}
	
	@RequestMapping("/updateDietMain.do")
	public String updateDietMain(DietVO vo,HttpServletResponse response) {
		//System.out.println("updateDietMain 컨트롤러옴!");
 
		// dayCalorie를 컨트롤러에서 직접 규현(아침+점심+저녁 칼로리)
		vo.setDayCalorie(vo.getBreakfastCalorie()+vo.getLunchCalorie()+vo.getDinerCalorie()+vo.getAnotherCalorie());
		
		dietService.updateDiet(vo);
		DietVO newData = dietService.selectOne(vo);
		//System.out.println(vo);		
		
		Date ddate = newData.getDdate();
		String breakfast = newData.getBreakfast();
		String lunch = newData.getLunch();
		String diner = newData.getDiner();
		String another = newData.getAnother();
		int breakfastCalorie = newData.getBreakfastCalorie();;
		int lunchCalorie = newData.getLunchCalorie();
		int dinerCalorie = newData.getDinerCalorie();
		int anotherCalorie = newData.getAnotherCalorie();
		int dayCalorie = newData.getDayCalorie();
		
	   // System.out.println(ddate);
				
		String result = "[{\"ddate\":\"" + ddate+"\",\"breakfast\":\"" + breakfast + "\",\"lunch\":\""+lunch+"\",\"diner\":\""+diner+"\",\"another\":\""+another+"\",\"breakfastCalorie\":\""+breakfastCalorie+"\",\"lunchCalorie\":\""+lunchCalorie+"\",\"dinerCalorie\":\""+dinerCalorie+"\",\"anotherCalorie\":\""+anotherCalorie+"\",\"dayCalorie\":\""+dayCalorie+"\"}]";
		//System.out.println("result는 : "+result);
		
		PrintWriter out;
		try {
			response.setContentType("text/html; charset=UTF-8"); 
			out = response.getWriter();
			out.println(result);
		} catch (IOException e) {
			System.out.println("updateDiet중 에러발생");
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@RequestMapping("/dietList.do")
	public String myDiet(UserInfoVO vo, Model model, HttpServletRequest request) {

		List<DietVO> datas = new ArrayList<DietVO>();
		session = request.getSession();
		vo = (UserInfoVO) session.getAttribute("uVO");

		datas = dietService.selectAll(vo);

		// 페이징 처리 로직
		String url = "dietList.jsp";
		String indexx = request.getParameter("index");
		int index = 1;
		if (indexx != null) {
			index = Integer.parseInt(indexx);
		}
		url = url + "?index=" + index;

		// 한페이지에 들어가는 게시물 수
		int pagingSize = 5;
		// 생성자 순서대로 int pageSize(한페이지 게시물 수), int thisPageNum(현재 페이지 번호), int
		// totalPostCnt(총 포스트 갯수)
		Paging paging = new Paging(pagingSize, index, datas.size());
		paging.makePaging();
		// 페이징 for문으로 표기 할 수 있도록 하기
		ArrayList<Integer> pagingIndex = new ArrayList<Integer>();// 뷰에서 나타내는 페이징 수와 버튼여부 객체
		int page = paging.getStartPageNum();
		// 1 5
		for (int i = paging.getStartPageNum(); i <= paging.getEndPageNum(); i++) {
			pagingIndex.add(page);
			page++;
		}
		// 해당하는 페이지에 데이터만 주기 캡슐화 진행
		DietPaging dp = new DietPaging(datas, index);
		if (datas.size() != 0) {
			dp.excuteSlice();
		}
		model.addAttribute("isLast", paging.isLast());
		model.addAttribute("isFirst", paging.isFirst());
		model.addAttribute("pagingIndex", pagingIndex);
		model.addAttribute("index", index);
		// 가공된(페이징처리된) 다이어트리스트
		model.addAttribute("DietList", dp.getNewDatas());
		
		//model.addAttribute("datas", datas);

		return "dietList.jsp";

	}

	@RequestMapping("/getDietData.do")
	public String getDietData(DietVO vo, Model model) {
		System.out.println("getDietData 컨트롤러옴!");
		
		DietVO data = dietService.selectOne(vo);
		
		
		model.addAttribute("dietData", data);
		
		return "getDietPage.jsp";
				
	}
	
}
