package heal.project.me.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import heal.project.me.member.model.service.MemberService;
import heal.project.me.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	// 암호화 처리(spring-security에 bean등록 후) 후 작성
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로깅시 추가
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 관리자가 수정하기
	@RequestMapping("nowyMember.do")
	public String nowyMember(@RequestParam("mid") int mid, Model model) {

		int result = mService.nowyMember(mid);

		if (result > 0) {
			return "redirect:mlist.do?page=1";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 관리자가 수정하기
	@RequestMapping("nownMember.do")
	public String nownMember(@RequestParam("mid") int mid, Model model) {

		int result = mService.nownMember(mid);

		if (result > 0) {
			return "redirect:mlist.do?page=1";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 관리자가 수정하기
	@RequestMapping("lvMMember.do")
	public String lvMMember(@RequestParam("mid") int mid, Model model) {

		int result = mService.lvMMember(mid);

		if (result > 0) {
			return "redirect:mlist.do?page=1";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 관리자가 수정하기
	@RequestMapping("lvAMember.do")
	public String lvAMember(@RequestParam("mid") int mid, Model model) {

		int result = mService.lvAMember(mid);

		if (result > 0) {
			return "redirect:mlist.do?page=1";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 관리자가 수정하기
	@RequestMapping("mupdate2.do")
	public String update2Member(@ModelAttribute Member m, Model model, @RequestParam("post") String post) {

		int result = mService.update2Member(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "admin/memberListView";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 내정보 테스트 페이지로 이동 -- 임시 --나중에지움
	@RequestMapping("minsert2.do")
	public String minsert2() {
		return "admin/memberView";
	}

	// 회원 리스트 *** 이부분 수정하면 경필한테 알려주셈
	@RequestMapping("mlist.do")
	public String MemberListMethod(@RequestParam("page") int currentPage, Model model) {

		int limit = 10;
		ArrayList<Member> list = mService.selectMemberList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = mService.getListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) (double) currentPage / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

			return "admin/memberListView";
		} else {
			model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}

	// 로그인 페이지로 이동
	@RequestMapping("loginView.do")
	public String loginView(HttpServletRequest request, Model model, HttpSession session)
			throws UnsupportedEncodingException {

		/* 자동 로그인 (쿠키 불러오기 ) */
		Cookie[] cookieId = request.getCookies(); // 쿠키 받아온다
		Cookie[] cookiePwd = request.getCookies();
		String autoId = "";
		String autoPwd = "";
		if (cookieId != null && cookiePwd != null) { // 만약 쿠키가 null이 아니라면

			/*
			 * for(int i = 0; i < cookieId.length; i++) { System.out.println(i +
			 * "번째 쿠키 이름: " + cookieId[i].getName()); System.out.println(i + "번째 쿠키 값: " +
			 * cookieId[i].getValue()); }
			 * 
			 * for(int i = 0; i < cookiePwd.length; i++) { System.out.println(i +
			 * "번째 쿠키 이름: " + cookiePwd[i].getName()); System.out.println(i + "번째 쿠키 값: " +
			 * cookiePwd[i].getValue()); }
			 */

			for (int i = 0; i < cookieId.length; i++) {
				if (cookieId[i].getName().trim().equals("autoId")) {
					// System.out.println(cookieId[i].getValue());
					autoId = cookieId[i].getValue(); // autoId라는 이름의 키가 있을 경우 문자열에 그 쿠키의 값을 넣는다.
				}
				if (cookiePwd[i].getName().trim().equals("autoPwd")) {
					// System.out.println(cookiePwd[i].getValue());
					autoPwd = cookiePwd[i].getValue(); // autoId라는 이름의 키가 있을 경우 문자열에 그 쿠키의 값을 넣는다.
				}
			}
			model.addAttribute("autoId", autoId);
			model.addAttribute("autoPwd", autoPwd);
		}
		/* 자동 로그인 */

		return "member/login";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("enrollView.do")
	public String enrollView() {

		if (logger.isDebugEnabled()) // 프로젝트 배포시에 성능저하를 막기위해 logger의 레벨이 DEBUG인지 여부를 확인
			logger.debug("회원등록페이지");

		return "member/memberInsertForm";
	}

	// 아이디 찾기 페이지로 이동
	@RequestMapping("findIdView.do")
	public String findIdView() {
		return "member/findId";
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("findPwView.do")
	public String findPwView() {
		return "member/findPw";
	}

	// 이메일 발송 메소드
	public void send_mail(Member member, String subject, String message) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "hhw@naver.com"; // *본인의 아이디 입력 (ex.joker@naver.com)
		String hostSMTPpwd = "hihelloworld"; // *비밀번호 입력(네이버 로그인 비밀번호)

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "hhw@naver.com"; // *보내는 사람 email
		String fromName = "Hi Hello World"; // 보내는 사람 이름
		String sub = subject; // 메일 제목
		String msg = message; // 메일 내용

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail(); // 받는 사람 email

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // SMTP 포트 번호 입력

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(sub);
			email.setHtmlMsg(msg); // 본문 내용
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	/*
	 * // 로그인 메소드 - @ModelAttribute를 이용한 값 전달 방법(4)
	 * 
	 * @RequestMapping(value = "login.do", method = RequestMethod.POST) public
	 * String memberLogin(@ModelAttribute Member m,
	 * 
	 * @RequestParam(value = "auto_login", required = false) String auto_login,
	 * HttpServletResponse response, Model model, HttpSession session) {
	 * 
	 * Member loginUser = mService.loginMember(m);
	 * 
	 * // System.out.println(loginUser);
	 * 
	 * if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(),
	 * loginUser.getPwd())) { // 로그인 성공 session.setAttribute("loginUser",
	 * loginUser);
	 * 
	 * 자동로그인 Cookie cookieId = null; Cookie cookiePwd = null; String login_rem =
	 * auto_login; // 체크 되어있으면 on 안되어있으면 null이 넘어옴
	 * 
	 * if (login_rem != null && login_rem.trim().equals("on")) { // 체크가 되어있으면
	 * cookieId = new Cookie("autoId", java.net.URLEncoder.encode(m.getId())); //
	 * ("키",값) cookiePwd = new Cookie("autoPwd",
	 * java.net.URLEncoder.encode(m.getPwd())); // cookie.setDomain("localhost");
	 * 
	 * // 쿠키 유호시간을 세팅 1년 cookieId.setMaxAge(60 * 60 * 24 * 365);
	 * cookiePwd.setMaxAge(60 * 60 * 24 * 365);
	 * 
	 * // 쿠키값을 클라이언트에 저장 response.addCookie(cookieId);
	 * response.addCookie(cookiePwd); } else { // 체크가 안된 상태에서 로그인이 들어왔을 때 cookieId =
	 * new Cookie("autoId", null); cookieId.setMaxAge(0); // 유효시간을 0으로
	 * 
	 * cookiePwd = new Cookie("autoPwd", null); cookiePwd.setMaxAge(0);
	 * 
	 * response.addCookie(cookieId); // 쿠키값을 클라이언트에 저장
	 * response.addCookie(cookiePwd); } 자동로그인
	 * 
	 * System.out.println("로그인 회원정보 : " + loginUser);
	 * 
	 * return "main/home";
	 * 
	 * } else { model.addAttribute("msg", "로그인 실패"); return "common/errorPage"; } }
	 */
	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
		Member loginUser = mService.loginMember(m);

		/*
		 * //네이버로 로그인 SNSLogin snsLogin = new SNSLogin(naverSns);
		 * model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		 */

		/*
		 * String bcrypt = bcryptPasswordEncoder.encode(m.getPwd());
		 * System.out.println("loginUser" + loginUser); System.out.println("Member" +
		 * m); System.out.println( bcryptPasswordEncoder.matches(m.getPwd(),
		 * loginUser.getPwd()));
		 * 
		 * System.out.println(bcrypt.length()+","+m.getPwd().length());
		 * System.out.println(loginUser.getPwd().length());
		 * 
		 * logger.info("암호화 " + bcrypt +"글자수"+ m.getPwd().length());
		 */

		if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);

			return "redirect:home.do";

		} else {
			model.addAttribute("msg", "로그인 실패");
			return "common/errorPage";
		}
	}

	// 네이버 아이디로 로그인
	@RequestMapping("naverLogin.do")
	public void naverLogin(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		String token = request.getParameter("token");
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			System.out.println(res.toString());

			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject) obj;
			JSONObject resObj = (JSONObject) jsonObj.get("response");

			// 왼쪽 변수 이름은 원하는 대로 정하면 된다.
			// 단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
			String naverCode = (String) resObj.get("id");
			String email = (String) resObj.get("email");
			String name = (String) resObj.get("name");
			String nickname = (String) resObj.get("nick");
			String mobile = (String) resObj.get("mobile");
			// 핸드폰 번호에서 숫자만 추출
			mobile = mobile.replaceAll("[^0-9]", "");

			// 테스트출력
			String data = resObj.toString();
			System.out.println(data);

			Member loginMember = new Member();
			loginMember.setId(naverCode);
			loginMember.setName(name);
			loginMember.setEmail(email);
			loginMember.setNick(nickname);
			loginMember.setPhone(mobile);

			System.out.println("loginMember : " + loginMember);

			// 네이버 아이디로 임시 로그인
			session.setAttribute("loginUser", loginMember);
			// 뷰페이지를 선택해서 내보냄
			response.sendRedirect("index.jsp");

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// 카카오 아이디로 로그인 페이지로 이동(redirect)
	@RequestMapping("kakaoLogin.move")
	public String kakaoLogin() {
		return "member/kakaoLogin";
	}

	// 카카오 아이디로 로그인
	@RequestMapping(value = "kakaoLogin.do", method = RequestMethod.POST)
	public String kakaoLoginView(@RequestParam("kid") String kid, @RequestParam("kname") String kname,
			@RequestParam("kemail") String kemail, HttpSession session) {
		Member loginMember = new Member();

		loginMember.setId(kid);
		loginMember.setName(kname);
		loginMember.setNick(kname);
		loginMember.setEmail(kemail);

		System.out.println("loginMember : " + loginMember);

		// 카카오 아이디로 임시 로그인
		session.setAttribute("loginUser", loginMember);

		return "redirect:home.do";
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃을 처리를 위해서 커맨드 객체로 세션의 상태를 관리할 수있는 SessionStatus 객체가 필요하다.

		// 세션의 상태를 확정지어주는 메소드 호출
		status.setComplete();

		return "redirect:home.do";
	}

	// '내정보 관리하기'로 이동
	@RequestMapping("myInfoUpdate.do")
	public String myInfoUpdateView(@RequestParam("id") String id, Model model) {

		System.out.println(id);

		// Service 호출
		Member member = mService.selectMember(id);

		model.addAttribute("member", member);
		return "member/infoUpdate";
	}

	// 프로필 수정페이지로 이동
	@RequestMapping("myProfile.do")
	public String profileView() {
		return "member/profile";
	}

	// 회원가입
	@RequestMapping("minsert.do")
	public String insertMember(@ModelAttribute Member m, Model model, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2) {

		// 회원가입전에 회원정보를 출력
		// System.out.println("Member 정보 : " + m);
		// System.out.println("Address 정보 : " + post + ", " + address1 + ", " +
		// address2);

		// System.out.println("암호화 처리 후 값 : " +
		// bcryptPasswordEncoder.encode(m.getPwd()));

		/*
		 * 비밀번호 -> 평문으로 되어있다. 1234 DB에 저장을 할때 평문으로 저장하면 안되기 때문에 "암호화" 처리를 한다.
		 * 
		 * 스프링 시큐리티라는 모듈에서 제공하는 bcrypt라는 암호화 방식으로 암호화 처리를 할꺼다.
		 * 
		 * * bcrypt란? DB에 비밀번호를 저장할 목적으로 설계되었다.
		 * 
		 * jsp/servlet 에서 했던 SHA-512암호화(단방향해쉬알고리즘)
		 * 
		 * 단점 : 111 평문 동일한 암호화 코드를 반화한다.
		 * 
		 * 해결점 : 솔팅(salting) -> 원문에 아주작은랜덤문자열 추가해서 암호화 코드를 발생시킨다.
		 */

		// 기존의 평문을 암호문으로 바꾸서 m객체에 다시 담자.
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());

		// setter를 통해서 Member객체의 pwd를 변경
		m.setPwd(encPwd);

		// 주소데이터를 ", "를 구분자로 저장
		if (!post.equals("")) {
			m.setAddress(post + ", " + address1 + ", " + address2);
		}

		// System.out.println("수정된 Member객체 : " + m);

		// 회원가입 서비스를 호출
		int result = mService.insertMember(m);

		if (result > 0) {
			return "main/home"; // 로그인 페이지로 이동
		} else {
			model.addAttribute("msg", "회원가입실패!");
			return "common/errorPage";
		}

	}

	// '내정보' 수정하기
	@RequestMapping("mupdate.do")
	public String memberUpdate(@ModelAttribute Member m, Model model, @RequestParam("post") String post,
			@RequestParam("addr1") String addr1, @RequestParam("addr2") String addr2) {

		System.out.println("Member : " + m);
		System.out.println("Address 정보 : " + post + ", " + addr1 + ", " + addr2);
		System.out.println("암호화 처리 후 값 : " + bcryptPasswordEncoder.encode(m.getPwd()));

		// 기존의 평문을 암호문으로 바꾸서 m객체에 다시 담자.
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		// setter를 통해서 Member객체의 pwd를 변경
		m.setPwd(encPwd);

		// 주소 데이터를 ","를 구분자로 두고 저장
		if (!post.equals("")) {
			m.setAddress(post + "," + addr1 + "," + addr2);
		}

		int result = mService.updateMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "member/infoUpdate";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 회원탈퇴
	@RequestMapping("mdelete.do")
	public String memberDelete(SessionStatus status, @RequestParam("id") String id, Model model) {

		int result = mService.deleteMember(id);

		if (result > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패!");
			return "common/errorPage";
		}
	}

	// 아이디 찾기
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	public String findId(@ModelAttribute Member m, Model model) {

		String memberId = mService.findId(m).getId();

		if (memberId != null) {
			// 아이디 찾기 성공
			model.addAttribute("memberId", memberId);

			return "member/findIdAfter";
		} else {
			model.addAttribute("msg", "아이디 찾기 실패!");
			return "common/errorPage";
		}
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findPw.move", method = RequestMethod.POST)
	public String findPw(@ModelAttribute Member m, Model model) {

		Member findUser = mService.findPw(m);

		if (findUser != null) {
			// 회원 정보 찾기 성공
			model.addAttribute("findUser", findUser);

			return "member/findPwAfter";
		} else {
			model.addAttribute("msg", "회원 정보 찾기 실패!");
			return "common/errorPage";
		}
	}

	// 임시 비밀번호 생성 및 메일 발송
	@RequestMapping(value = "findPw.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public @ResponseBody String findPwAfter(@ModelAttribute Member m, Model model) {

		// 회원 찾기
		Member member = mService.findPw(m);

		// 임시 비밀번호 생성
		String pwd = "";
		for (int i = 0; i < 12; i++) {
			pwd += (char) ((Math.random() * 26) + 97);
		}

		// 임시 비밀번호로 설정
		String encPwd = bcryptPasswordEncoder.encode(pwd); // 암호화
		member.setPwd(pwd);
		int result = mService.setTempPw(member);

		if (result > 0) {
			// 메일 제목
			String subject = "[ME]임시 비밀번호 생성 알림 메일 입니다.";

			// 메일 내용
			String msg = "<table width='640px' style='BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid' cellspacing='0' cellpadding='10' border='0'>";
			// 메일 상단
			msg += "<tbody><tr><td><table align='center' cellspacing='0' cellpadding='0' border='0'><tbody><tr>";
			msg += "<td align='middle' height='30' style='padding-top: 10px;'></td></tr></tbody></table>";
			// 본문 부분
			msg += "<table align='left' cellspacing='0' cellpadding='0' border='0' width='640px'><tbody><tr><td width='139px'></td><td align='middle'style='padding-right: 0px; padding-left: 0px; padding-bottom: 20px;' width='362px'>";
			msg += "<div><br><b>" + member.getName()
					+ "</b>님 안녕하세요. <b>Hi Hello World</b>입니다. <br> 요청하신 비밀번호찾기를 안내 드립니다.<br>";
			msg += "<b>" + member.getName()
					+ "</b>님의 임시 비밀번호 입니다.<br> 비밀번호를 변경하여 사용하세요.</div><div style='MARGIN: 10px; PADDING: 10px; TEXT-ALIGN: CENTER; BACKGROUND-COLOR: #FDEADA; COLOR: #FF0000; FONT-WEIGHT: BOLD;'>";
			msg += "임시 비밀번호  : " + pwd + "</div></td><td width='139px'></td></tr></tbody></table>";
			// 메일 하단
			msg += "<table align='center' cellspacing='0' cellpadding='0' width='100%' border='0'><tbody><tr><td height='14'></td></tr><tr><td align='middle' style='padding-right: 4px; padding-left: 4px; padding-bottom: 4px; font: 8pt tahoma; padding-top: 4px' bgcolor='#f6f6f6'><font color='#545454'>Copyright(C) <strong>hhw.com</strong> All right reserved.</font></td></tr><tr><td height='6'></td></tr></tbody></table>";
			msg += "</td></tr></tbody></table>";

			try {
				send_mail(member, subject, msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// alert창
			return "<script type='text/javascript'>" + "alert(\"임시 비밀번호로 정상적으로 변경되었습니다.\\n로그인 페이지로 이동합니다.\");"
					+ "location.href=\"/hhw/loginView.do\";" + "</script>";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = mService.idCheck(id);

		if (result > 0) {
			return "fail";
		} else {
			return "ok";
		}
	}

}
