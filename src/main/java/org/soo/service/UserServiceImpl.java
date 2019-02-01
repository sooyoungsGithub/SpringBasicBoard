package org.soo.service;

import java.util.Date;

import javax.inject.Inject;

import org.soo.domain.UserVO;
import org.soo.dto.LoginDTO;
import org.soo.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public void KeepLogin(String uid, String sessionId, Date next) throws Exception {
		
		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		// TODO Auto-generated method stub
		return dao.checkUserWithSessionKey(value);
	}

}
