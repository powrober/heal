package heal.project.me.b_reply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import heal.project.me.b_reply.model.vo.B_Reply;
import heal.project.me.b_reply.model.vo.B_ReplyoardPage;

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
	
	//관리자용
	public ArrayList<B_Reply> selectadminBoardReplyList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<B_Reply> list = sqlSession.selectList("b_replyMapper.selectadminBoardReplyList", new B_ReplyoardPage(startRow, endRow));
		return (ArrayList<B_Reply>)list;
	}

	public int getListCount() {
		return sqlSession.selectOne("b_replyMapper.getListCount");
	}

	
}
