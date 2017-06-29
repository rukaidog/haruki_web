/**
 * 
 */
package com.haruki.lab.login.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;

import com.haruki.lab.db.JdbcHelper;
import com.haruki.lab.db.rs.Result;
import com.haruki.lab.login.LoginController;
import com.haruki.lab.model.Leaderboard;
import com.haruki.lab.model.Top5Score;
import com.haruki.lab.model.UserInfo;
import com.haruki.lab.model.UserLoginSession;
import com.haruki.lab.model.UserScore;
import com.haruki.lab.model.AllUser;
/**
 * @author mid1672
 * @param <SnakeGame>
 *
 */
public class LoginControllerImpl implements LoginController {
	private JdbcHelper jdbc = JdbcHelper.getInstance();
	private final static String SQL_LOGIN = "Insert into loginSession (username,login_time,session_id) values( ?, now(),  ? )";
	private final static String SQL_LOGOUT = "UPDATE loginSession SET logout_time =now() WHERE session_id =?";

	@SuppressWarnings("rawtypes")
	@Override
	public LoginCheckResult login(String userName, String password) {
		String sql = "select * from login where username= ?";// 定义一个查询语句
		Result rs = jdbc.executeQuery(sql, userName);// 运行上面的语句
		SortedMap[] r = rs.getRows();
		if (r.length > 0) {
			String actualPsw = (String) r[0].get("password");
			return password.equals(actualPsw) ? LoginCheckResult.USER_CHECK_OK : LoginCheckResult.USER_CHECK_NG;
		} else {
			return LoginCheckResult.USER_NOT_FOUND;
		}
	}

	@Override
	public ForgotPasswordUserCheck checkUserInfo(String userName, String email) {
		String sql = "select count(*) from login where username =? and email= ?";
		return jdbc.isExist(sql, userName, email) ? ForgotPasswordUserCheck.USER_CHECK_OK
				: ForgotPasswordUserCheck.USER_CHECK_NG;
	}

	@Override
	public void resetPassword(String userName, String newPassword) {
		// TODO Auto-generated method stub

		String sql = "UPDATE login SET password =? WHERE username =? ";
		jdbc.executeUpdate(sql, newPassword, userName);
	}

	@Override
	public RegisterUser register(String userName, String newPassword, String email, String gender, String age,
			String[] colors) {
		// TODO Auto-generated method stub

		String sql_select = "select count(*) from login where username = ?";
		String sql_insert = "Insert into login (username,password,email,gender,age,color,register_date,register_time)"
				+ "values( ?, ?, ?, ?,?, ?, now(), now())";
		if (jdbc.isExist(sql_select, userName)) {
			return RegisterUser.USER_REGISTER_NG;
		} else {
			StringBuilder cs = new StringBuilder();
			for (int i = 0, l = colors.length; i < l; i++) {
				if (i > 0) {
					cs.append(",");
				}
				cs.append(colors[i]);
			}
			jdbc.executeUpdate(sql_insert, userName, newPassword, email, gender, age, cs.toString());// 运行上面的语句
			return RegisterUser.USER_REGISTER_OK;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserInfo findUserByName(String userName) {
		String sql = "select * from login where username= ?";// 定义一个查询语句
		Result rs = jdbc.executeQuery(sql, userName);// 运行上面的语句
		Map<String, ?>[] r = rs.getRows();

		if (r != null && r.length > 0) {
			Map<String, ?> row = r[0];
			Date d = (Date) row.get("register_date");
			String fmtDate = formatDate(d);

			UserInfo ui = new UserInfo();
			ui.setUserName((String) (row.get("username")));
			ui.setAge((String) (row.get("age")));
			ui.setGender((String) (row.get("gender")));
			ui.setRegisterDate(fmtDate);
			return ui;
		}
		return null;
	}

	/**
	 * @param d
	 * @return
	 */
	private String formatDate(Date d) {
		return formatDate(d, "yyyy-MM-dd");
	}

	private String formatDateTime(Date d) {
		return formatDate(d, "yyyy-MM-dd HH:mm:ss");
	}
	private String formatTime(Date d) {
		return formatDate(d, "HH:mm:ss");
	}
	private String formatDate(Date d, String fmt) {

		return (d == null) ? null : new SimpleDateFormat(fmt).format(d);
	}

	public boolean loginSession(String userName, String sessionId) {
		return jdbc.executeUpdate(SQL_LOGIN, userName, sessionId) > 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haruki.lab.login.LoginController#logout(java.lang.String)
	 */
	@Override
	public boolean logout(String sessionId) {
		return jdbc.executeUpdate(SQL_LOGOUT, sessionId) > 0;
	}

	@Override
	public boolean search(String userName) {
		String sql = "select count(*) from login where username =?";

		return jdbc.isExist(sql, userName);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haruki.lab.login.LoginController#searchHistory(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginSession> searchHistory(String userName) {
		// TODO Auto-generated method stub
		String sql = "select * from loginsession where username =? order by login_time DESC LIMIT 10";
		Result rs = jdbc.executeQuery(sql, userName);// 运行上面的语句
		Map<String, ?>[] rows = rs.getRows();
		// Arrays.asList(rows).stream().map((row, out) -> {
		//
		// });
		List<UserLoginSession> retRows = new ArrayList<>();
		for (int i = 0; i < rows.length; i++) {
			retRows.add(transform(rows[i]));
		}
		return retRows;
	}

	private UserLoginSession transform(Map<String, ?> row) {

		UserLoginSession ui = new UserLoginSession();
		ui.setUserName((String) (row.get("username")));
		ui.setLoginTime(formatDateTime((Date) (row.get("login_time"))));
		ui.setLogoutTime(formatDate((Date) (row.get("logout_time"))));

		return ui;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserScore> searchScore(String userName) {
		// TODO Auto-generated method stub
		String sql = "select * from score where (username =? and score>0) order by score DESC limit 30";
		Result rs = jdbc.executeQuery(sql, userName);// 运行上面的语句
		Map<String, ?>[] rows = rs.getRows();
		List<UserScore> retRows = new ArrayList<>();
		for (int i = 0; i < rows.length; i++) {
			retRows.add(transform1(rows[i]));
		}
		return retRows;
	}

	private UserScore transform1(Map<String, ?> row) {

		UserScore uu = new UserScore();
		uu.setUserName((String) (row.get("username")));
		uu.setScore((Integer) (row.get("score")));
		uu.setGameTime(formatDateTime((Date) (row.get("game_time"))));

		return uu;
	}

	@SuppressWarnings("unchecked")
	public List<Top5Score> showTop5Score() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM score WHERE score>0 ORDER BY score DESC LIMIT 5";
		Result rs = jdbc.executeQuery(sql);// 运行上面的语句
		Map<String, ?>[] rows = rs.getRows();
		List<Top5Score> retRows = new ArrayList<>();
		for (int i = 0; i < rows.length; i++) {
			retRows.add(transform2(rows[i]));
		}
		return retRows;
	}

	private Top5Score transform2(Map<String, ?> row) {

		Top5Score ii = new Top5Score();
		ii.setUserName((String) (row.get("username")));
		ii.setScore((Integer) (row.get("score")));
		return ii;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Leaderboard> showAllScore() {
		// TODO Auto-generated method stub
		String sql = "SELECT * from score where score>0  order by score DESC limit 30";
		Result rs = jdbc.executeQuery(sql);// 运行上面的语句
		Map<String, ?>[] rows = rs.getRows();
		List<Leaderboard> retRows = new ArrayList<>();
		for (int i = 0; i < rows.length; i++) {
			retRows.add(transform3(rows[i]));
		}
		return retRows;
	}

	private Leaderboard transform3(Map<String, ?> row) {

		Leaderboard iu = new Leaderboard();
		iu.setUserName((String) (row.get("username")));
		iu.setScore((Integer) (row.get("score")));
		iu.setGameTime(formatDateTime((Date) (row.get("game_time"))));

		return iu;
	}

	@SuppressWarnings("unchecked")
	public List<AllUser> showAllUser() {
		// TODO Auto-generated method stub
		String sql = "SELECT * from login order by id";
		Result rs = jdbc.executeQuery(sql);// 运行上面的语句
		Map<String, ?>[] rows = rs.getRows();
		List<AllUser> retRows = new ArrayList<>();
		for (int i = 0; i < rows.length; i++) {
			retRows.add(transform4(rows[i]));
		}
		return retRows;
	}

	private AllUser transform4(Map<String, ?> row) {

		AllUser uii = new AllUser();
		uii.setId((Integer) (row.get("id")));
		uii.setUserName((String) (row.get("username")));
		uii.setGender((String) (row.get("gender")));
		uii.setAge((String) (row.get("age")));
		uii.setRegisterDate(formatDate((Date) (row.get("register_date"))));
		uii.setRegisterTime(formatTime((Date) (row.get("register_time"))));


		return uii;
	}

	
	public void snake(String userName, Integer score) {
		String sql = "Insert into score(username,score,game_time) values(?,?,now())";

		jdbc.executeUpdate(sql, userName, score);
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haruki.lab.login.LoginController#snake(java.lang.String, int)
	 */

}
