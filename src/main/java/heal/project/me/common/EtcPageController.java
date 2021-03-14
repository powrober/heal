package heal.project.me.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcPageController {

	// Coming Soon 페이지 이동
	@RequestMapping("comingsoon.do")
	public String comingSoon() {
		return "common/comingsoon";
	}
	
	// QNA 페이지 이동
	@RequestMapping("qna.do")
	public String qna() {
		return "common/qna";
	}

	// ENJOY 페이지 이동
	@RequestMapping("enjoy.do")
	public String enjoy() {
		return "common/enjoy";
	}
	
	// 관리자 회원 페이지 이동
	@RequestMapping("admin.do")
	public String admin() {
		return "admin/memberListView";
	}
	
	// 관리자 불량회원 페이지 이동
	@RequestMapping("blame.do")
	public String blame() {
		return "admin/blameListView";
	}

	// Room 페이지 이동
	@RequestMapping("room.do")
	public String room() {
		return "room/room";
	}
	
	// Roominfo 페이지 이동
	@RequestMapping("roominfo.do")
	public String roominfo() {
		return "room/roominfo";
	}

}
