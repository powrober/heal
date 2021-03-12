package heal.project.me.b_reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heal.project.me.b_reply.model.dao.B_ReplyDao;
import heal.project.me.b_reply.model.vo.B_Reply;

@Service("b_replyService")
public class B_ReplyServiceImpl implements B_ReplyService {

	@Autowired
	private B_ReplyDao b_replyDao;
	
	@Override
	public int insertB_Reply(B_Reply b_reply) {
		return b_replyDao.insertB_Reply(b_reply);
	}

	@Override
	public int updateB_Reply(B_Reply b_reply) {
		return b_replyDao.updateB_Reply(b_reply);
	}

	@Override
	public int deleteB_Reply(int brid) {
		return b_replyDao.deleteB_Reply(brid);
	}

	@Override
	public B_Reply selectReply(int brid) {
		return b_replyDao.selectB_Reply(brid);
	}
	
	// 댓글 목록

	@Override
	public ArrayList<B_Reply> selectList(int brid) {
		return b_replyDao.selectList(brid);
	}


}