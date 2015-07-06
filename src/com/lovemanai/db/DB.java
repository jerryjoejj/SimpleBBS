package com.lovemanai.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
	public static ResultSet excuteSelect(String sql) {
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
	public static void excuteDML(String sql) {
		try {
			PreparedStatement pStat = createPreparedStatement(sql);
			pStat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 针对形如insert into article values(?,?,?)这样的DML语句执行的修正
	 * 传入一条上述sql语句，并且将问号代表的参数一并传入，替换掉所有问号内容产生一条DML语句，并执行
	 * @param sql
	 * @param object
	 */
	public static void excuteDML(String sql, Object... object) {
	
		List<String> sbList = new ArrayList<String>();
		String str = new String();
		StringBuilder sqlRebuilt = new StringBuilder();
		int j = 0;
		for(int i = 0; i < sql.length(); i++) {
			char[] c = new char[1];
			c[0] = sql.charAt(i);
			str = new String(c);
			if(str.equals("?")) {
				if(object[j].getClass().getTypeName().equals("java.lang.Integer")){
					str = (Integer)object[j] + "";
					j++;
				} else if(object[j].getClass().getTypeName().equals("java.lang.Double")) {
					str = (Double)object[j] + "";
					j++;
				} else if(object[j].getClass().getTypeName().equals("java.lang.Float")) {
					str = (Float)object[j] + "";
					j++;
				} else if(object[j].getClass().getTypeName().equals("java.lang.String")) {
					str = "'" + (String)object[j] + "'";
					j++;
				}
				
			}
			sbList.add(str);
		}
		
		for(int i = 0; i < sbList.size(); i++) {
			sqlRebuilt.append(sbList.get(i));
		}
		
		excuteDML(sqlRebuilt.toString());
	}
	

	
	/**
	 * 创建一个PreparedStatement对象
	 * @param sql
	 * @return
	 */
	private static PreparedStatement createPreparedStatement(String sql) {
		PreparedStatement pStat = null;
		if(conn == null) {
			getConn();
		}
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
