package heal.project.me.member.model.service;

import java.util.ArrayList;

import heal.project.me.member.model.vo.Member;

public interface MemberService {

	// 관리자가회원 정보 수정 서비스를 위한 메소드
	int nowyMember(int mid);
	int nownMember(int mid);
	int lvMMember(int mid);
	int lvAMember(int mid);
	
	
	// 회원 정보 수정 서비스를 위한 메소드
	int update2Member(Member m);

	int getListCount();
	ArrayList<Member> selectMemberList(int currentPage, int limit);
	
	// 회원 로그인 서비스를 위한 메소드
	Member loginMember(Member m);

	// 회원 가입 서비스를 위한 메소드
	int insertMember(Member m);

	// 회원 정보 수정 서비스를 위한 메소드
	int updateMember(Member m);
	
	// 회원 탈퇴 서비스를 위한 메소드
	int deleteMember(String id);

	// 아이디 찾기 위한 메소드
	Member findId(Member m);

	// 비밀번호 찾기 위한 메소드
	Member findPw(Member m);
	
	// 임시 비밀번호 설정 위한 메소드
	int setTempPw(Member m);
	
	// 아이디 중복 체크를 위한 메소드
	int idCheck(String id);
	
	// 회원정보 리스트를 위한 메소드
	ArrayList<Member> selectAll();
	
	// 랭킹 높은 수
	ArrayList<Member> selectTop3();

	// '내정보 관리하기'로 이동
	Member selectMember(String id);
	
}
