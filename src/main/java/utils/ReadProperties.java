package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class ReadProperties {
	
	private static final String FILE_CONFIG = "\\config.properties";
	
	public static Properties getProperties () {
		Properties properties = new Properties();
        InputStream inputStream = null;
		try {
			inputStream = ReadProperties.class.getClassLoader()
                    .getResourceAsStream(FILE_CONFIG);
			
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return properties;
	}
}
