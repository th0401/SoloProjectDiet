package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.body.BodyService;
import model.body.BodyVO;
import model.diet.DietService;
import model.diet.DietVO;
import model.userInfo.UserInfoService;
import model.userInfo.UserInfoVO;

@Controller
public class UserInfoController {


	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private BodyService bodyService;

	@Autowired
	private DietService dietService;

	private HttpSession session;
	private String path = "C:\\LEE_0622\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SoloProjectDiet\\images\\profile\\";
	
	
	
	
	@RequestMapping("/main.do")
	public String getAllList(@RequestParam(value="condition",defaultValue="title",required=false)String condition,@RequestParam(value="keyword",defaultValue="",required=false)String keyword,UserInfoVO vo,Model model,HttpServletRequest request,HttpServletResponse response) {

		List<BodyVO> bodyDatas = new ArrayList<BodyVO>();
		List<DietVO> dietDatas = new ArrayList<DietVO>();
		JSONObject jsonBodyData = null;
		JSONArray JBodyDatas = null;
		session = request.getSession();
		vo = (UserInfoVO)session.getAttribute("uVO");

		if(vo != null) {
			bodyDatas = bodyService.selectAll(vo);
			dietDatas = dietService.selectAll(vo);

			//System.out.println(vo);
			//System.out.println(bodyDatas);

			JBodyDatas = new JSONArray();
			
			
			SimpleDateFormat formatD = new SimpleDateFormat("yy년 MM월 dd일 E요일");
			
			if(bodyDatas.size() > 6) {
				for(int i = 0; i<7; i++) {
					// 제이슨데이터를 계속 만드는 이유는 제이슨 데이터를 갱신해서 이 데이터들을 arrJson에 넣기위함이다!
					jsonBodyData = new JSONObject(); 			
				
					jsonBodyData.put("date", formatD.format(bodyDatas.get(6-i).getBdate()));
					jsonBodyData.put("weight", bodyDatas.get(6-i).getWeight());
					JBodyDatas.add(jsonBodyData);
					//System.out.println(JBodyDatas);
				}
			}else if(bodyDatas.size()!=0 && bodyDatas.size() < 7) {
				// 데이터의 크기만큼만 포문을 돌린다!
				for(int i = 0; i<bodyDatas.size(); i++) {
					// 제이슨데이터를 계속 만드는 이유는 제이슨 데이터를 갱신해서 이 데이터들을 arrJson에 넣기위함이다!
					jsonBodyData = new JSONObject(); 			
				
					jsonBodyData.put("date", formatD.format(bodyDatas.get((bodyDatas.size()-1)-i).getBdate()));
					jsonBodyData.put("weight", bodyDatas.get((bodyDatas.size()-1)-i).getWeight());
					JBodyDatas.add(jsonBodyData);
					//System.out.println(JBodyDatas);
				}
			}// 데이터가 하나도없으면 그냥 만들지 않는다!	
			
			//System.out.println(jsonBodyData);

			/*String host_url = "http://localhost:8088/app/main.do";
			HttpURLConnection conn = null;

			URL url;

			BufferedWriter bw = null;
			PrintWriter out;

			try {
				url = new URL(host_url);
				conn = (HttpURLConnection)url.openConnection();

				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Type", "application/json");

				conn.setDoOutput(true);
				bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

				bw.write(JBodyDatas.toString());
				out = response.getWriter();
				out.println(JBodyDatas);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				try {
					bw.flush();
					bw.flush();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}*/
			
		}

		BodyVO lastBodyVO = new BodyVO(); 
		DietVO lastDietVO = new DietVO();

		if(!bodyDatas.isEmpty()) {
			lastBodyVO = bodyDatas.get(0);
		}
		if(!dietDatas.isEmpty()) {
			lastDietVO = dietDatas.get(0);
		}
		//System.out.println("라스트BodyVO는 "+lastBodyVO);
		//System.out.println("라스트DietVO는 "+lastDietVO);

		//request.setAttribute("datas", datas);

		model.addAttribute("bodyDatas", bodyDatas);
		model.addAttribute("dietDatas", dietDatas);
		model.addAttribute("lastBodyVO", lastBodyVO);
		model.addAttribute("lastDietVO", lastDietVO);
		model.addAttribute("jbd",JBodyDatas);
		return "main.jsp";
	}

	@RequestMapping("/myPage.do")
	public String myPage(UserInfoVO vo,Model model,HttpServletRequest request) {

		List<BodyVO> datas = new ArrayList<BodyVO>();
		session = request.getSession();
		vo = (UserInfoVO)session.getAttribute("uVO");

		if(vo != null) {
			datas = bodyService.selectAll(vo);
		}


		//System.out.println(datas);

		BodyVO lastBodyVO = new BodyVO(); 
		if(!datas.isEmpty()) {
			//System.out.println("데이터 0번째 : "+datas.get(0));
			lastBodyVO = datas.get(0);
		}

		//System.out.println("라스트바디VO는 : "+lastBodyVO);
		//request.setAttribute("datas", datas);
		model.addAttribute("lastBodyVO", lastBodyVO);
		model.addAttribute("datas", datas);

		return "myPage.jsp";
	}

	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,UserInfoVO vo,HttpServletResponse response) {
		//System.out.println("id: "+request.getParameter("id")+", pw: "+request.getParameter("pw"));
		UserInfoVO data = userInfoService.login(vo);
		PrintWriter out;
		if(data!=null) {

			//System.out.println(data);
			session=request.getSession();
			session.setAttribute("uVO", data);
			return "redirect:main.do";

		}
		else {
			//System.out.println(data);
						
			try {
				response.setContentType("text/html; charset=UTF-8"); 
				out = response.getWriter();
				out.println("<script>alert('로그인에 실패하셨습니다. 아이디 혹은 비밀번호를 확인해주세요.');  history.go(-1); </script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null; // 전송페이지가 없으므로, null처리

			// DS -> HM -> C -> VR
		}

	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();		
		return "redirect:main.do";

	}
	@RequestMapping(value="/loginPage.do",method=RequestMethod.GET)
	public String loginPage() {
		return "login.jsp";	
	}


	@RequestMapping("/signUp.do")
	public String signUp(UserInfoVO vo) {
		//System.out.println("회원가입 왔음!!!");
		
		String defaultImgFile = "defaultimg.jpg";
		vo.setPath("images\\profile\\"+defaultImgFile);

		userInfoService.insertUser(vo); 

		return "login.jsp";

	}

	@RequestMapping(value="/signUpPage.do",method=RequestMethod.GET)
	public String signUpPage() {
		return "signUp.jsp";	
	}

	@RequestMapping("/updateProfile.do")
	public String updateProfile(UserInfoVO vo,HttpServletResponse response,HttpServletRequest request) {
		session = request.getSession();
		//System.out.println(vo);
		UserInfoVO uVo = (UserInfoVO)session.getAttribute("uVO");
		vo.setId(uVo.getId());
		MultipartFile fileupload = vo.getFileUpload();
		//System.out.println("프로필컨트롤러 파일업로드이름 : "+fileupload);
		
		 String fileName = fileupload.getOriginalFilename();
         String filename2 = vo.getId()+fileName.substring(fileName.length()-4,fileName.length()); //확장자
         //System.out.println("파일설정 "+filename2);
         //System.out.println("파일이름 : "+fileName);
		
		
		try {
		fileupload.transferTo(new File(path+filename2));
		 vo.setPath("images\\profile\\"+filename2);

	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		userInfoService.updateProfile(vo);
		PrintWriter out;
		uVo.setPath(vo.getPath());
			try {
				out = response.getWriter();
				out.println("<script>opener.location.reload();</script>");
				out.println("<script>window.close();</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		

		return null;
		
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUserInfo(HttpSession session,HttpServletRequest request,UserInfoVO vo) {
		System.out.println(vo);
		userInfoService.updateUser(vo);
		UserInfoVO data = userInfoService.login(vo);
		session = request.getSession();
		session.setAttribute("uVO", data);

		return "redirect:myPage.do";
	}
	
	
	@RequestMapping("/deleteUser.do")
	public String deleteUserInfo(HttpSession session,UserInfoVO vo) {
		session.invalidate();
		userInfoService.deleteUser(vo);

		//System.out.println("회원탈퇴입니다!");

		return "redirect:main.do";
	}

	@RequestMapping("newsPage.do")
	public String newsPage(Model model) {
		
		String newsUrl = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EC%8B%9D%EC%8A%B5%EA%B4%80";
		Connection conn = Jsoup.connect(newsUrl);
		
		Document document;
		try {
			document = conn.get();
			Elements ImageElements = document.getElementsByClass("dsc_thumb");
			//System.out.println(ImageElements);
			Elements contentElements = document.getElementsByClass("news_area");
			//System.out.println(contentElements);
			Elements locationElements = document.getElementsByClass("news_tit");
			//System.out.println(locationElements);
			Elements textContents = document.getElementsByClass("dsc_wrap");
			//System.out.println(textContents);
			
			List<String> newsImg = new ArrayList<String>();
			List<String> title = new ArrayList<String>();
			List<String> dNewsUrl = new ArrayList<String>();
			List<String> content = new ArrayList<String>();
			
			
			for(Element v:ImageElements) {
				newsImg.add(v.select("img").attr("src"));
			}
			
			for(Element v:contentElements) {
				title.add(v.select("a").attr("title"));								
			}
			for(Element v:locationElements) {
				
				dNewsUrl.add(v.select("a").attr("href"));				
			}
		
			for(Element v:textContents) {
				content.add(v.text());
								
			}

			List<String> datas = new ArrayList<String>();
			for(int i = 0; i<8; i++) {
				datas.add(newsImg.get(i));
				
			}
		
			model.addAttribute("title", title);
			model.addAttribute("newsImg", newsImg);
			model.addAttribute("dNewsUrl", dNewsUrl);
			model.addAttribute("content", content);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "newsPage.jsp";
	
	}
	
	@RequestMapping("/checkID.do")
	public String checkID(HttpServletResponse response,HttpServletRequest request) {
	
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out;
		try {
			out = response.getWriter();
			//System.out.println(userInfoService.checkID(request.getParameter("id"))==true);
			if(userInfoService.checkID(request.getParameter("id"))){
				out.println("true"); // out.println으로 ajax data에게 데이터가 넘어가게됨
									  // true로 데이터를 보내면 데이터가 있다는 의미. 즉 존재하는 아이디라는 뜻
			}
			 
			else { 
				out.println("false"); // false로 데이터를 보내면 데이터가 없다는 의미. 즉 사용 가능한 아이디라는 뜻 
			}
		} catch (IOException e) {
			
			e.printStackTrace();
		}		
		
		
		// 이동경로 없음

		return null;
	}
	
	
}
