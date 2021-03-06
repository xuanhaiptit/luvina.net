/**
 * Copyright(C) 2010 Luvina Software Company
 * Oct 20, 2017 MessageProperties.java
 */
package properties;

import java.util.Properties;

/**
 * Class lấy dữ liệu từ file message_ja.properties
 * 
 * @author LA-PM
 *
 */
public class MessageProperties {
	public static Properties properties;

	/**
	 * Phương thức lấy ra info database
	 * 
	 */
	
	public static void loadProperties() {
		// lấy ngữ cảnh (môi trường) để có thể tải các lớp tài nguyên
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		properties = new Properties();
		try {
			// load dữ liệu, lưu vào luồng của lớp Properties, dữ liệu sẽ luôn dc lưu
			properties.load(classLoader.getResourceAsStream("message_ja.properties"));
		} catch (Exception e) {
			System.out.println("ConfigMysql " + e.getMessage());
		}
	}

	/**
	 * Lấy data từ properties
	 * 
	 * @param key
	 *            Data tương ứng
	 * @return Trả về giá trị key tương ứng
	 */
	
	public static String getString(String key) {
		if (properties == null) { // nếu chưa load dữ liệu vào properties
			loadProperties(); // load dữ liệu
		}
		// lấy dữ liệu trong properties theo key trong file property
		String data = properties.getProperty(key);
		return data;
	}
}
