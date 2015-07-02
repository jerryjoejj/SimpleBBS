package com.lovemanai.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 实体类，一个实体类对象表示数据库中的一条记录
 * @author lovemanai
 *
 */
public class Article {
	private int id;
	private int pId;
	private int rootId;
	private String title;
	private String cont;
	private String pDate;
	private boolean isLeaf; //true叶子节点，false非叶子节点，数据库中0表示叶子节点，非0表示非叶子节点
	private int grade;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public Article(int id, int pId, int rootId, String title, String cont,
			String pDate, boolean isLeaf) {
		this.id = id;
		this.pId = pId;
		this.rootId = rootId;
		this.title = title;
		this.cont = cont;
		this.pDate = pDate;
		this.isLeaf = isLeaf;
		setGrade(0);
	}
	
	
	
	public static Article initFromResultSet(ResultSet rs) {
		Article article = null;
		try {
			article = new Article(rs.getInt("id"), rs.getInt("pid"), rs.getInt("rootid"),rs.getString("title"),
						rs.getString("cont"), rs.getString("pdate"),rs.getInt("isLeaf") == 0 ? true : false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}
}
