package org.soo.service;

import java.util.List;

import javax.inject.Inject;

import org.soo.domain.BoardVO;
import org.soo.domain.Criteria;
import org.soo.domain.SearchCriteria;
import org.soo.persistence.BoardDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null) { return; }
		
		for(String fileName : files) {
			dao.addAttach(fileName);
		}
		
	}

	@Transactional
	@Override
	public BoardVO read(Integer bno) throws Exception {
		
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		
		dao.update(board);
		
		Integer bno = board.getBno();
		
		// 기존꺼 삭제 후 수정
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null) {return;}
		
		for(String fileName : files) {
			dao.replaceAttach(fileName, bno);
		}
		
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {

		dao.deleteAttach(bno);
		dao.delete(bno);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(bno);
	}

	
}
