package com.lovemanai.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.lovemanai.db.DB;

/**
 * 测试DB类
 * @author lovemanai
 *
 */
public class TestDB {
	public static void main(String[] args) {
		String sql = "select * from article";
		ResultSet rs = (ResultSet)DB.excuteSQL(sql);
		try {
			while(rs.next()) {
				System.out.println(rs.getInt("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
