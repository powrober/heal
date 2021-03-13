package heal.project.me.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heal.project.me.member.model.dao.MemberDao;
import heal.project.me.member.model.vo.Member;

@Service("mService")
public class MemerServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	// 트랜잭션 처리용
	//@Autowired
	//SqlSessionTemplate sqlSession;

	// 관리자가 회원 정보 수정 
	@Override
	public int update2Member(Member m) {
		return mDao.update2Member(m);
	}
	
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);

		return result;
	}
	
	// 회원 정보 수정 
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	@Override
	public Member findId(Member m) {
		Member loginUser = mDao.findId(m);
		return loginUser;
	}

	@Override
	public Member findPw(Member m) {
		Member loginUser = mDao.findPw(m);
		return loginUser;
	}
	
	@Override
	public int setTempPw(Member m) {
		return mDao.setTempPw(m);
	}
	
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	@Override
	public ArrayList<Member> selectAll() {
		return mDao.selectList();
	}

	@Override
	public ArrayList<Member> selectTop3() {
		return mDao.selectTop3();
		}

	// '내정보 관리하기'로 이동
	@Override
	public Member selectMember(String id) {
		return mDao.selectMember(id);
	}

	@Override
	public int getListCount() {
		return mDao.getListCount();
	}

	@Override
	public ArrayList<Member> selectMemberList(int currentPage, int limit) {
		return mDao.selectMemberList(currentPage, limit);
	}
	
}
