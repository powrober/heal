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

}
