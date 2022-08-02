package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.EorderDao;
import com.itwill.book.dto.Eorder;



public class EbookService {
	private EorderDao eorderDao;
	
	public EbookService() throws Exception{
		eorderDao = new EorderDao();
	}
	
	public long create(int e_no, String id)throws Exception {
		if(eorderDao.selectByIdNo(id, e_no) == null) {
			int rowCount = eorderDao.insert(e_no, id);
			rowCount = rowCount*60*60*24*90;
			return rowCount;
		}
		int rowCount = eorderDao.update(e_no, id);
		long remaintime =eorderDao.remaintime(id, e_no);
		long a = rowCount * remaintime;
		return a;
	}
	
	public int remove(int e_no, String id)throws Exception {
		return eorderDao.delete(e_no, id);
	}
	
	public List<Eorder> selectById(String id)throws Exception {
		return eorderDao.selectById(id);
	}
	
	public Eorder selectByIdNo(String id, int no)throws Exception {
		return eorderDao.selectByIdNo(id, no);
	}
	
	public long remaintime(String id, int no) throws Exception{
		return eorderDao.remaintime(id, no);
	}
}
