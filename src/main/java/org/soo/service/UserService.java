package org.soo.service;

import java.util.Date;


import org.soo.domain.UserVO;
import org.soo.dto.LoginDTO;


public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public void KeepLogin(String uid, String sessionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);
}
