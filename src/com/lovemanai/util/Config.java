package com.lovemanai.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


/**
 * 从数据库配置文件config.config读取数据库配置信息
 * @author lovemanai
 *
 */
public class Config {
	private static Map<String, String> map = new HashMap<String, String>();
	
	/**
	 * 读取配置文件信息，放入Map集合中
	 * @return
	 */
	public static Map<String, String> parse() {
		map.clear();
		BufferedReader in = null;
		//获取配置文件路径
		String path = Config.class.getClassLoader().getResource("\\").getPath();
		try {
			in = new BufferedReader(new FileReader(path + "\\conf\\config.config"));
			String line = null;
			while((line = in.readLine()) != null) {
				String[] str = line.split("=");
				String key = str[0];
				String value = str[1];
				map.put(key, value);
			}
		} catch (FileNotFoundException e) {
			System.out.println("找不到配置文件！");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null)in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
}
