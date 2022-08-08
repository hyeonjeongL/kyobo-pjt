package com.itwill.book.dao.test;

import com.itwill.book.dao.IPRegisterDao;
import com.itwill.book.dto.IPRegister;

public class IPRegisterDaoTest {

	public static void main(String[] args)throws Exception {

		IPRegisterDao ipRegisterDao = new IPRegisterDao();
		IPRegister ipRegister = new IPRegister(0, "성민컴", "192.168.12.1", "seongmin", null);
		System.out.println(ipRegisterDao.insert(ipRegister));
		
		System.out.println(ipRegisterDao.selectById("seongmin"));
		System.out.println(ipRegisterDao.delete(4));
		
	}

}
