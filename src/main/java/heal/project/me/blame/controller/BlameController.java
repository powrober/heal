package heal.project.me.blame.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import heal.project.me.blame.model.service.BlameService;
import heal.project.me.blame.model.vo.Blame;

@Controller
public class BlameController {
	@Autowired
	private BlameService BlameService;
	
	
	// 신고글 등록 요청 처리용
	@RequestMapping(value = "b.blame.insert.do", method = RequestMethod.POST)
	public String BlameInsertMethod(Blame Blame, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile,  Model model) {

		System.out.println(Blame);

		if (BlameService.insertBlame(Blame) > 0) {
			return "redirect:blist.do?page=1";
		} else {
			model.addAttribute("msg", "게시글 등록 실패.");
			return "common/errorPage";
		}
	}
	
	// 게시글 페이지별 목록 조회 요청 처리용
	@RequestMapping("b.blame.list.do")
	public String blameListMethod(@RequestParam("page") int currentPage, Model model) {
		
		int limit = 10;
		ArrayList<Blame> list = BlameService.selectList(currentPage, limit);
		
		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = BlameService.getListCount();
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

			return "admin/blameListView";
		} else {
			model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}
	
}