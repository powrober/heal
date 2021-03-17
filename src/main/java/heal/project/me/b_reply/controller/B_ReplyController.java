package heal.project.me.b_reply.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import heal.project.me.b_reply.model.service.B_ReplyService;
import heal.project.me.b_reply.model.vo.B_Reply;

@Controller
public class B_ReplyController {
	@Autowired
	private B_ReplyService b_replyService;

	@RequestMapping(value = "brinsert.do", method = RequestMethod.POST)
	public String replyInsertMethod(B_Reply b_reply, Model model) {
		
		if (b_replyService.insertB_Reply(b_reply) > 0) {
			
			return "redirect:bdetail.do?bid=" + b_reply.getB_ref_bid();
		} else {
			model.addAttribute("msg", b_reply.getB_ref_bid() + "번 글에 대한 댓글달기 실패.");
			return "common/errorPage";
		}
	}

	
	// ajax 원글에 대한 댓글 조회 처리용
		@RequestMapping(value = "brlist.do", method = RequestMethod.POST)
		@ResponseBody
		public String b_replyListMethod(@RequestParam("b_ref_bid") int b_ref_bid) throws UnsupportedEncodingException {
			// 원글에 대한 댓글 조회 요청
			ArrayList<B_Reply> list = b_replyService.selectList(b_ref_bid); // 결과를 받아줌

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮기기(복사)
			for (B_Reply b_reply : list) {
				// reply 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("brid", b_reply.getBrid()); 
				job.put("bruser", b_reply.getBruser()); // 인코딩 해서 제이슨 객체 안에 담는다
				job.put("brcontent", URLEncoder.encode(b_reply.getBrcontent(), "utf-8"));
				job.put("br_date", b_reply.getBr_date().toString());

				// job 를 jarr 에 저장
				jarr.add(job);
			}

			// 전송용 json 객체에 jarr 담음
			sendJson.put("list", jarr);

			return sendJson.toJSONString(); // jsonView 가 리턴됨

		}
	
	
	
	// 관리자 댓글 관리용
	@RequestMapping("adminbrlist.do")
	public String b_replyListMethod(@RequestParam("page") int currentPage, Model model){

		// 원글에 대한 댓글 조회 요청
		int limit = 10;

		ArrayList<B_Reply> list = b_replyService.selectadminBoardReplyList(currentPage, limit); // 결과를 받아줌

		// 페이지 처리와 관련된 값 처리
				// 총 페이지 계산을 위한 총 목록 갯수 조회
				int listCount = b_replyService.getListCount();
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
					
					return "admin/AdminBoardReplyListView";
				} else {
					model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
					return "common/errorPage";
				}
			}
	
	
	@RequestMapping("brdel.do")
	public String replyDeleteMethod(@RequestParam("brid") int brid, @RequestParam("bid") int bid, Model model) {
		if (b_replyService.deleteB_Reply(brid) > 0) {
			return "redirect:bdetail.do?bid=" + bid;
		} else {
			model.addAttribute("msg", brid + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="brupdate.do", method=RequestMethod.POST)
	public String replyUpdateMethod(B_Reply reply,
			@RequestParam("bid") int bid, Model model) {
		if (b_replyService.updateB_Reply(reply) > 0) {
			return "redirect:bdetail.do?bid=" + bid;
		} else {
			model.addAttribute("msg", reply.getBrid() + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
}