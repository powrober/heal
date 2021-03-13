package heal.project.me.blame.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heal.project.me.blame.model.dao.BlameDao;
import heal.project.me.blame.model.vo.Blame;

@Service("blameService")
public class BlameServiceImpl implements BlameService {
   @Autowired //의존성 어노테이션 
   private BlameDao blameDao;
         
   @Override
   public int getListCount() {
      return blameDao.getListCount();
   }

   @Override
   public ArrayList<Blame> selectList(int currentPage, int limit) {
      return blameDao.selectList(currentPage, limit);
   }

   @Override
   public int insertBlame(Blame blame) {
      return blameDao.insertBlame(blame);
   }

}