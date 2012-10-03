package me.second.hand.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.MessageFormat;

import me.second.hand.cons.StaticInfo;

public class EmailFile {
	public String getHtmlString(String emailFile) throws IOException {

		File file = null;
		FileReader fileReader = null;
		BufferedReader bufferedReader = null;
		try {
			String emailHtmlString = "";
			String pathString = this.getClass().getClassLoader()
					.getResource("").getPath();
			file = new File(pathString + "email\\" + emailFile);
			// fileReader = new filein
			InputStream inputStream = new FileInputStream(file);
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);

			String lineString = bufferedReader.readLine();
			while (null != lineString) {
				emailHtmlString += lineString;
				lineString = bufferedReader.readLine();
			}
			return emailHtmlString;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (bufferedReader != null) {
				bufferedReader.close();
			}
			if (fileReader != null) {
				fileReader.close();
			}
		}

		return null;

	}

	public String getEmailHtmlByArge(String emailFile,String username, String url)throws IOException {
		
		return MessageFormat.format(getHtmlString(emailFile), username, url,url, MyTimeUtil.getSystemTime(StaticInfo.TIME_STYPE_DAY));
	}
}
