package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.IPRegisterDao;
import com.itwill.book.dto.IPRegister;

public class IPRegisterService {
	private IPRegisterDao ipRegisterDao;
	
	public IPRegisterService()throws Exception {
		ipRegisterDao = new IPRegisterDao();
	}
	
	public int create(IPRegister ipRegister) throws Exception{
		List<IPRegister> ipRegistersList = ipRegisterDao.selectById(ipRegister.getU_id());
		if(ipRegistersList.size() >4) {
			return 2;
		}else 
		return ipRegisterDao.insert(ipRegister);
		
	}
	
	
	public int remove(int i_no) throws Exception{
		return ipRegisterDao.delete(i_no);
	}
	
	public List<IPRegister> selectById(String u_id) throws Exception{
		return ipRegisterDao.selectById(u_id);
	}
	
	
	
	
	
	
	
	
}
