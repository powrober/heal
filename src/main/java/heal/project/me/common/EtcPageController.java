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
	
	// RoomList 페이지 이동
	@RequestMapping("roomlist.do")
	public String roomlist() {
		return "room/roomlist";
	}
	
	// Room 페이지 이동
	@RequestMapping("blue101.do")
	public String blue101() {
		return "room/blue101";
	}
	// Room 페이지 이동
	@RequestMapping("blue102.do")
	public String blue102() {
		return "room/blue102";
	}
	// Room 페이지 이동
	@RequestMapping("blue103.do")
	public String blue103() {
		return "room/blue103";
	}
	// Room 페이지 이동
	@RequestMapping("blue201.do")
	public String blue201() {
		return "room/blue201";
	}
	// Room 페이지 이동
	@RequestMapping("blue202.do")
	public String blue202() {
		return "room/blue202";
	}
	// Room 페이지 이동
	@RequestMapping("blue203.do")
	public String blue203() {
		return "room/blue203";
	}
	// Room 페이지 이동
	@RequestMapping("purple101.do")
	public String purple101() {
		return "room/purple101";
	}
	// Room 페이지 이동
	@RequestMapping("purple102.do")
	public String purple102() {
		return "room/purple102";
	}
	// Room 페이지 이동
	@RequestMapping("purple103.do")
	public String purple103() {
		return "room/purple103";
	}
	// Room 페이지 이동
	@RequestMapping("purple201.do")
	public String purple201() {
		return "room/purple201";
	}
	// Room 페이지 이동
	@RequestMapping("purple202.do")
	public String purple202() {
		return "room/purple202";
	}
	// Room 페이지 이동
	@RequestMapping("purple203.do")
	public String purple203() {
		return "room/purple203";
	}


}
