package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import model.body.BodyService;
import model.body.BodyVO;
import model.body.BodyPaging;
import model.userInfo.UserInfoVO;

@Controller
public class BodyController {

	@Autowired
	private BodyService bodyService;
	
	private HttpSession session;
	
	@RequestMapping("/insertBody.do")
	public String insertBody(BodyVO vo) {
		System.out.println("insertBody 컨트롤옴!");
		
		bodyService.insertBody(vo);
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateBody.do")
	public String updateBody(BodyVO vo,HttpServletResponse response) {
		System.out.println("updateBody 컨트롤옴!");
		BodyVO newData = new BodyVO();
		bodyService.updateBody(vo);
		newData = bodyService.selectOne(vo);
		
		
		float weight = newData.getWeight();
		float height = newData.getHeight();
	    System.out.println(weight);
	  
	    String result = "[{\"weight\":\"" + weight+"\",\"height\":\"" + height + "\"}]";
	    System.out.println(result);
	    
	    PrintWriter out;
		try {
			out = response.getWriter();
			out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    	
		return null;
		
		
	}
	
	@RequestMapping("/deleteBody.do")
	public String deleteBody(BodyVO vo,HttpServletResponse response) {
		System.out.println("deleteBody 컨트롤옴!");
		
		bodyService.deleteBody(vo);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/bodyList.do")
	public String myBodyPage(UserInfoVO uVO,Model model,HttpServletRequest request) {
		
		List<BodyVO> datas = new ArrayList<BodyVO>();
		session = request.getSession();
		uVO = (UserInfoVO)session.getAttribute("uVO");
		
		
			datas = bodyService.selectAll(uVO);
			
			// 페이징 처리 로직
			String url="bodyList.jsp";	
			String indexx=request.getParameter("index");
			int index=1;
			if(indexx!=null){
				index=Integer.parseInt(indexx);
			}
			url= url+ "?index="+index;
			
			// 한페이지에 들어가는 게시물 수
			int pagingSize = 6;
			// 생성자 순서대로 int pageSize(한페이지 게시물 수), int thisPageNum(현재 페이지 번호), int totalPostCnt(총 포스트 갯수)
			Paging paging = new Paging(pagingSize,index,datas.size());
			paging.makePaging();
			// 페이징 for문으로 표기 할 수 있도록 하기
			ArrayList<Integer> pagingIndex = new ArrayList<Integer>();// 뷰에서 나타내는 페이징 수와 버튼여부 객체
			int page = paging.getStartPageNum();
			//					1							5
			for(int i = paging.getStartPageNum();i<=paging.getEndPageNum();i++) {
				pagingIndex.add(page);
				page++;
			}
			// 해당하는 페이지에 데이터만 주기 캡슐화 진행
			BodyPaging bp = new BodyPaging(datas, index);
			if(datas.size()!=0) {
				bp.excuteSlice();
			}
		
		
		//System.out.println(datas);
		
		//request.setAttribute("datas", datas);
			model.addAttribute("isLast", paging.isLast());
			model.addAttribute("isFirst", paging.isFirst());
			model.addAttribute("pagingIndex", pagingIndex);
			model.addAttribute("index", index);
			// 가공된(페이징처리된) 바디리스트
			model.addAttribute("BodyList", bp.getNewDatas());
			//model.addAttribute("datas", datas);
		
		return "bodyList.jsp";
	}
	
	// myPage에서 최신 body정보만 변경하는 엑션 spa 활용안함!
		@RequestMapping("/updateRecentBody.do")
		public String updateRecentBody(BodyVO vo,HttpServletResponse response) {
			System.out.println("updateRecentBody 컨트롤옴!");
			
			bodyService.updateBody(vo);
			
			return "redirect:myPage.do";
		}
	
	// myPage에서 최신 body정보만 삭제하는 엑션 spa 활용안함!
	@RequestMapping("/deleteRecentBody.do")
	public String deleteRecentBody(BodyVO vo,HttpServletResponse response) {
		System.out.println("deleteRecentBody 컨트롤옴!");
		
		bodyService.deleteBody(vo);
		
		return "redirect:myPage.do";
	}
	
	
}
