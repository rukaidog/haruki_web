package com.haruki.lab.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.haruki.lab.db.exception.DbAccessError;
import com.haruki.lab.db.rs.Result;
import com.haruki.lab.db.rs.ResultImpl;

public class JdbcHelper {

    private String driverStr; //= "org.postgresql.Driver";
    private String url;// = "jdbc:postgresql://localhost:5432/OPGG";
    private String dbusername;// = "postgres";
    private String dbpassword;// = "postgres";
    private static JdbcHelper instance;
    
    public static synchronized JdbcHelper getInstance() {
    	
    	if(instance ==null) {
    		instance = new JdbcHelper();
    	}
    	return instance;
    }
    
     /**
	 * 
	 */
	public JdbcHelper() {
		Properties ps = new Properties();
		try {
			ps.load(JdbcHelper.class.getResourceAsStream("/jdbc.properties"));
		} catch (IOException e) {
			throw new RuntimeException("Read configuration file failed!", e);
		}
		this.url = (String) ps.get("jdbc.url");
		this.driverStr = (String) ps.get("jdbc.driver");
		this.dbusername = (String) ps.get("jdbc.user");
		this.dbpassword = (String) ps.get("jdbc.password");
	}
    
    public int executeUpdate(String s, Object ... params) {

    	System.out.print("--更新语句:"+s+"\n");
      Connection conn = this.createConnection();
      PreparedStatement ps = null;
      try {
      	ps = setJdbcParams(conn, s, params);
      	return ps.executeUpdate();
          
      } catch (Exception ex) {
      	
      	ex.printStackTrace();
      	System.out.println("执行更新错误！");
      	throw new DbAccessError("执行更新错误！", ex);
      } finally {
			this.closeQuietly(ps);
			this.closeQuietly(conn);
	 }
  }


    
    public boolean isExist(String sql, Object ... params) {
    	return this.count(sql, params) > 0;
    }
    
    /**
     *  
     * @param s
     * @param params
     * @return
     */
    public long count(String sql, Object ... params) {
    	
		System.out.print("--查询COUNT语句:" + sql + "\n");
		Result result = null;
		ResultSet rs = null;
		Connection conn = this.createConnection();
		PreparedStatement ps = null;
		try {
			ps = setJdbcParams(conn, sql, params);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getLong(1);
			}
		} catch (Exception ex) {
			// ex.pr
			System.out.println("ִ执行查询错误！");
			throw new DbAccessError("执行查询错误", ex);
		} finally {
			this.closeQuietly(rs);
			this.closeQuietly(ps);
			this.closeQuietly(conn);
		}
		return 0;
    }


	public Result executeQuery(String s, Object... params) {
		System.out.print("--查询语句:" + s + "\n");

		Result result = null;
		ResultSet rs = null;
		Connection conn = this.createConnection();
		PreparedStatement ps = null;
		try {
			ps = setJdbcParams(conn, s, params);
			rs = ps.executeQuery();
			result = new ResultImpl(rs, 0, -1);
		} catch (Exception ex) {
			// ex.pr
			System.out.println("ִ执行查询错误！");
			throw new DbAccessError("执行查询错误", ex);
		} finally {
			this.closeQuietly(rs);
			 this.closeQuietly(ps);
		 this.closeQuietly(conn);
		}
		return result;
	}
	
	/**
	 * @param conn
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	private PreparedStatement setJdbcParams(Connection conn, String sql, Object... params) throws SQLException {
		PreparedStatement ps;
		ps =conn.prepareStatement(sql);
      	for (int i = 0; i < params.length; i++) {
				ps.setObject(i+1, params[i]);
	   }
		return ps;
	}
    
    private void closeQuietly(AutoCloseable ac) {
    	if(ac !=null) {
    		try {
				ac.close();
			} catch (Exception e) {
				//Ignore it.
			}
    	}
    }
    
	private Connection createConnection() {
		
		Connection conn = null;
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(url, dbusername, dbpassword);
		} catch (Exception ex) {
//			System.out.println("数据连接失败！");
			throw new RuntimeException("数据连接失败！" , ex);
		}
		return conn;
	}
}
