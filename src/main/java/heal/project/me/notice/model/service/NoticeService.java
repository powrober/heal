package heal.project.me.notice.model.service;

import java.util.ArrayList;

import heal.project.me.common.SearchDate;
import heal.project.me.notice.model.vo.Notice;

public interface NoticeService {
	ArrayList<Notice> selectAll();
	int addNoticeCount(int nid);
	ArrayList<Notice> selectNoticeList(int currentPage, int limit);
	ArrayList<Notice> selectadminNoticeList(int currentPage, int limit);
	Notice selectnotice(int nid);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int nid);
	ArrayList<Notice> selectNewTop3();
	ArrayList<Notice> selectSearchTitle(String keyword);
	ArrayList<Notice> selectSearchWriter(String keyword);
	ArrayList<Notice> selectSearchDate(SearchDate dates);
	int getListCount();

}