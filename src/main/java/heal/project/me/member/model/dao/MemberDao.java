package heal.project.me.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import heal.project.me.member.model.vo.Member;
import heal.project.me.member.model.vo.MemberPage;

//@Repository라는 어노테이션 : DB와 접근하는 클래스에 부여(@Component의 구체화된 개념이다)
@Repository("mDao")
public class MemberDao {

	// 데이터베이스 연결객체 (root-context에서 작성한 bean으로 생성되어 주입이된다.)
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 관리자가 회원 정보 수정
		public int update2Member(Member m) {
			return sqlSession.update("memberMapper.update2Member", m);
		}
	
	
	public ArrayList<Member> selectMemberList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<Member> list = sqlSession.selectList("memberMapper.selectNewMemberList", new MemberPage(startRow, endRow));
		return (ArrayList<Member>)list;
	}
	
	public int getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}
	
	
	// 회원정보 리스트
	public ArrayList<Member> selectList(){
		List<Member> list = sqlSession.selectList("memberMapper.selectAll");
	
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectTop3() {
		List<Member> list = sqlSession.selectList("memberMapper.selectTop3");
		return (ArrayList<Member>)list;
	}

	public Member loginMember(Member m) {
		return (Member) sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}
	
	// 회원 정보 수정
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public Member findId(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member findPw(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.findPw", m);
	}
	
	public int setTempPw(Member m) {
		return sqlSession.update("memberMapper.setTempPw", m);
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	// '내정보 관리하기'로 이동
	public Member selectMember(String id) {
		return sqlSession.selectOne("memberMapper.selectMember", id);
	}
}
