package heal.project.me.n_reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heal.project.me.n_reply.model.vo.N_Reply;
import heal.project.me.n_reply.model.dao.N_ReplyDao;

@Service("n_replyService")
public class N_ReplyServiceImpl implements N_ReplyService {

	@Autowired
	private N_ReplyDao n_replyDao;
	
	@Override
	public int insertN_Reply(N_Reply n_reply) {
		return n_replyDao.insertN_Reply(n_reply);
	}

	@Override
	public int updateN_Reply(N_Reply n_reply) {
		return n_replyDao.updateN_Reply(n_reply);
	}

	@Override
	public int deleteN_Reply(int nrid) {
		return n_replyDao.deleteN_Reply(nrid);
	}

	@Override
	public N_Reply selectReply(int nrid) {
		return n_replyDao.selectN_Reply(nrid);
	}
	
	// 댓글 목록

	@Override
	public ArrayList<N_Reply> selectList(int nrid) {
		return n_replyDao.selectList(nrid);
	}


}