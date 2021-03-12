package heal.project.me.n_reply.controller;


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

import heal.project.me.n_reply.model.service.N_ReplyService;
import heal.project.me.n_reply.model.vo.N_Reply;

@Controller
public class N_ReplyController {
	@Autowired
	private N_ReplyService n_replyService;

	@RequestMapping(value = "nrinsert.do", method = RequestMethod.POST)
	public String replyInsertMethod(N_Reply n_reply, Model model) {
		
		if (n_replyService.insertN_Reply(n_reply) > 0) {
			
			return "redirect:ndetail.do?nid=" + n_reply.getNrid();
		} else {
			model.addAttribute("msg", n_reply.getNrid() + "번 글에 대한 댓글달기 실패.");
			return "common/errorPage";
		}
	}

	// ajax 원글에 대한 댓글 조회 처리용
	@RequestMapping(value = "nrlist.do", method = RequestMethod.POST)
	@ResponseBody
	public String n_replyListMethod(@RequestParam("nrid") int nrid) throws UnsupportedEncodingException {
		// 원글에 대한 댓글 조회 요청
		ArrayList<N_Reply> list = n_replyService.selectList(nrid); // 결과를 받아줌

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (N_Reply n_reply : list) {
			// reply 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("nrid", n_reply.getNrid()); 
			job.put("nruser", n_reply.getNruser()); // 인코딩 해서 제이슨 객체 안에 담는다
			job.put("nrcontent", URLEncoder.encode(n_reply.getNrcontent(), "utf-8"));
			job.put("nr_date", n_reply.getNr_date().toString());

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("list", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨

	}
	
	
	@RequestMapping("rdel.do")
	public String replyDeleteMethod(@RequestParam("nrid") int nrid, @RequestParam("nid") int nid, Model model) {
		if (n_replyService.deleteN_Reply(nrid) > 0) {
			return "redirect:ndetail.do?nid=" + nid;
		} else {
			model.addAttribute("msg", nrid + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="rupdate.do", method=RequestMethod.POST)
	public String replyUpdateMethod(N_Reply reply,
			@RequestParam("nid") int nid, Model model) {
		if (n_replyService.updateN_Reply(reply) > 0) {
			return "redirect:ndetail.do?nid=" + nid;
		} else {
			model.addAttribute("msg", reply.getNrid() + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
}