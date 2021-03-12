package heal.project.me.blame.model.service;

import java.util.ArrayList;

import heal.project.me.blame.model.vo.Blame;
import heal.project.me.common.SearchAndPage;
import heal.project.me.common.SearchDate;

public interface BlameService {
		
	// 조회수 많은 게시글 top3
	ArrayList<Blame> selectTop3();
	int getListCount();
	// 목록조회
	ArrayList<Blame> selectList();
	// 상세보기
	Blame selectOne(int blame_no);
	int addReadCount(int blame_no);
	// 원글 조회
	int insertBlame(Blame blame);
	int updateBlame(Blame blame);
	int deleteBlame(int blame_no);
	ArrayList<Blame> selectSearchTitle(SearchAndPage searches);
	ArrayList<Blame> selectSearchWriter(SearchAndPage searches);
	ArrayList<Blame> selectSearchDate(SearchAndPage searches);
	int getSearchTitleListCount(String keyword);
	int getSearchWriterListCount(String keyword);
	int getSearchDateListCount(SearchDate dates);
	ArrayList<Blame> selectList(int currentPage, int limit);

}