package com.lovemanai.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.lovemanai.util.Config;

public class DB {
	private static Connection conn = null;
	//private static PreparedStatement pStat = null; 
	
	/**
	 * 获得一个与数据库的连接
	 */
	public static void getConn() {
		Map<String, String> map = Config.parse();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(map.get("URL"),map.get("USERNAME"), map.get("PASSWORD"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("未找到相应驱动！");
		}
	}

	/**
	 * 执行一条select语句，返回一个ResultSet对象
	 * @param sql
	 * @return
	 */
	private static ResultSet excuteSelect(String sql) {
		ResultSet rs = null;
		getConn();
		try {
			PreparedStatement pStat = createPreparedStatement(sql);
			rs = pStat.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 执行一条DML语句（即insert，update，delete语句）
	 * @param sql
	 */
	private static void excuteDML(String sql) {
		try {
			PreparedStatement pStat = createPreparedStatement(sql);
			pStat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 传入一条SQL语句，判断语句首个单词
	 * 若为select，执行excuteSelect()方法，执行成功，返回一个ResultSet对象
	 * 否则执行excuteDML()方法，执行成功，返回1
	 * @param sql
	 * @return
	 */
	public static Object excuteSQL(String sql) {
		String[] str = sql.split(" ");
		if(str[0].trim().equalsIgnoreCase("select")) {
			return excuteSelect(sql);
		} else {
			excuteDML(sql);
			return null;
		}
	}
	
	/**
	 * 创建一个PreparedStatement对象
	 * @param sql
	 * @return
	 */
	private static PreparedStatement createPreparedStatement(String sql) {
		PreparedStatement pStat = null;
		try {
			pStat = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pStat;
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
