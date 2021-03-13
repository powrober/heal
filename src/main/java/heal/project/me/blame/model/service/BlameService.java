package heal.project.me.blame.model.service;

import java.util.ArrayList;

import heal.project.me.blame.model.vo.Blame;

public interface BlameService {
		
	int getListCount();
	int insertBlame(Blame blame);
	ArrayList<Blame> selectList(int currentPage, int limit);

}