package heal.project.me.n_reply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import heal.project.me.n_reply.model.vo.N_Reply;

@Repository("n_replyDao")
public class N_ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertN_Reply(N_Reply n_reply) {
		return sqlSession.insert("n_replyMapper.insertN_Reply", n_reply);
	}

	public int updateN_Reply(N_Reply n_reply) {
		return sqlSession.update("n_replyMapper.updateN_Reply", n_reply);
	}

	public int deleteN_Reply(int nrid) {
		return sqlSession.delete("n_replyMapper.deleteN_Reply", nrid);
	}

	public N_Reply selectN_Reply(int nrid) {
		return sqlSession.selectOne("n_replyMapper.selectN_Reply", nrid);
	}

	public ArrayList<N_Reply> selectList(int nrid) {
		List<N_Reply> list = sqlSession.selectList("n_replyMapper.selectList", nrid);
		return (ArrayList<N_Reply>)list;
	}
	
}
