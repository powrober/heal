package heal.project.me.blame.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import heal.project.me.blame.model.vo.Blame;
import heal.project.me.blame.model.vo.BlamePage;

@Repository("blameDao")
public class BlameDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int getListCount() {
		return sqlSession.selectOne("blameMapper.getListCount");
	}

	public ArrayList<Blame> selectList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<Blame> list = sqlSession.selectList("blameMapper.selectList", new BlamePage(startRow, endRow));
		return (ArrayList<Blame>)list;
	}

	public int insertBlame(Blame blame) {
		return sqlSession.insert("blameMapper.insertBlame", blame);
	}


}
