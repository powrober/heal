package heal.project.me.b_reply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import heal.project.me.b_reply.model.vo.B_Reply;

@Repository("b_replyDao")
public class B_ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertB_Reply(B_Reply b_reply) {
		return sqlSession.insert("b_replyMapper.insertB_Reply", b_reply);
	}

	public int updateB_Reply(B_Reply b_reply) {
		return sqlSession.update("b_replyMapper.updateB_Reply", b_reply);
	}

	public int deleteB_Reply(int brid) {
		return sqlSession.delete("b_replyMapper.deleteB_Reply", brid);
	}

	public B_Reply selectB_Reply(int brid) {
		return sqlSession.selectOne("b_replyMapper.selectB_Reply", brid);
	}

	public ArrayList<B_Reply> selectList(int b_ref_bid) {
		List<B_Reply> list = sqlSession.selectList("b_replyMapper.selectList", b_ref_bid);
		return (ArrayList<B_Reply>)list;
	}
	
}
