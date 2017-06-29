/**
 * 
 */
package com.haruki.lab.login;

import java.util.List;

import com.haruki.lab.login.impl.ForgotPasswordUserCheck;
import com.haruki.lab.login.impl.LoginCheckResult;
import com.haruki.lab.login.impl.RegisterUser;
import com.haruki.lab.model.UserInfo;
import com.haruki.lab.model.UserLoginSession;
import com.haruki.lab.model.UserScore;
import com.haruki.lab.model.Leaderboard;
import com.haruki.lab.model.Top5Score;
import com.haruki.lab.model.AllUser;
/**
 * @author haruki: mid1672
 *
 */
public interface LoginController {

	LoginCheckResult login(String userName, String password);
	
	ForgotPasswordUserCheck checkUserInfo(String userName, String email);
	
	void resetPassword(String userName, String newPassword);
	
	RegisterUser register(String userName, String newPassword, String email, String gender, String age, String[] colors);
	
	UserInfo findUserByName(String userName);
	
	boolean loginSession(String userName, String sessionId);
	
	boolean logout(String sessionId);
	
	boolean search(String userName);	
	
	List<UserLoginSession> searchHistory(String userName);
	
	List<UserScore> searchScore(String userName);
	
	List<Top5Score> showTop5Score();
	
	List<Leaderboard> showAllScore();
	
	List<AllUser> showAllUser();

	
	
}
