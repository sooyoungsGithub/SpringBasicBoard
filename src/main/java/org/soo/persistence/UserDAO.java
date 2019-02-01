package org.soo.persistence;

import java.util.Date;


import org.soo.domain.UserVO;
import org.soo.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);
}
