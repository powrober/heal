package heal.project.me.n_reply.model.service;

import java.util.ArrayList;

import heal.project.me.n_reply.model.vo.N_Reply;

public interface N_ReplyService {
	//댓글목록
	ArrayList<N_Reply> selectList(int nrid);
	int insertN_Reply(N_Reply n_reply);
	int updateN_Reply(N_Reply n_reply);
	int deleteN_Reply(int nrid);
	N_Reply selectReply(int nrid);
}
