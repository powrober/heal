package heal.project.me.b_reply.model.service;

import java.util.ArrayList;

import heal.project.me.b_reply.model.vo.B_Reply;

public interface B_ReplyService {
	//댓글목록
	ArrayList<B_Reply> selectList(int brid);
	ArrayList<B_Reply> selectadminBoardReplyList(int currentPage, int limit);
	int insertB_Reply(B_Reply b_reply);
	int updateB_Reply(B_Reply b_reply);
	int deleteB_Reply(int brid);
	B_Reply selectReply(int brid);
	int getListCount();

}
