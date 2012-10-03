package me.second.hand.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 
 * @author ww
 * 
 */
public class ImageCompact {
	/*
	 * @param oldFile 将要压缩的图片
	 * 
	 * @param width 压缩宽
	 * 
	 * @param height 压缩高
	 * 
	 * @param quality 压缩清晰度 <b>建议为1.0</b>
	 * 
	 * @param smallIcon 压缩图片后,添加的扩展名（在图片后缀名前添加）
	 * 
	 * @param percentage 是否等比压缩 若true宽高比率将将自动调整
	 * 
	 * 
	 * @return 如果处理正确返回压缩后的文件名 null则参数可能有误
	 */
	public static String doCompress(File file, int width, int height,
			float quality, String smallIcon, boolean percentage) {
		if (file != null) {
			Image srcFile = null;
			String newImage = null;
			try {

				// 文件不存在
				if (!file.exists()) {
					return null;
				}
				/* 读取图片信息 */
				srcFile = ImageIO.read(file);

				int new_w = width;
				int new_h = height;
				if (percentage) {
					// 为等比缩放计算输出的图片宽度及高度
					double rate1 = ((double) srcFile.getWidth(null)) / width;
					double rate2 = ((double) srcFile.getHeight(null))
							/ (double) height + 0.1;
					double rate = rate1 > rate2 ? rate1 : rate2;
					new_w = width;
					new_h = (int) (((double) srcFile.getHeight(null)) / rate1);
				}
				/* 宽高设定 */
				BufferedImage tag = new BufferedImage(new_w, new_h,
						BufferedImage.TYPE_INT_RGB);
				tag.getGraphics().drawImage(srcFile, 0, 0, new_w, new_h, null);
				/* 压缩后的文件名 */
				// String filePrex = oldFile.substring(0,
				// oldFile.lastIndexOf('.'));
				// newImage = filePrex + smallIcon +
				// oldFile.substring(filePrex.length());
				/* 压缩之后临时存放位置 */
				FileOutputStream out = new FileOutputStream(smallIcon);
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
				/* 压缩质量 */
				jep.setQuality(quality, true);
				encoder.encode(tag, jep);
				out.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				srcFile.flush();
				try {

				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			return newImage;
		} else {
			return null;
		}
	}

	public static boolean checkOver(File file, float width) {
		if (file != null) {
			Image srcFile = null;
			String newImage = null;
			try {

				// 文件不存在
				if (!file.exists()) {
					return false;
				}
				/* 读取图片信息 */
				srcFile = ImageIO.read(file);

				if (srcFile.getWidth(null) > 700) {
					return true;
				} else {
					return false;
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
		return false;
	}

	public static String createFileByBtye(byte[] file, String fileName) {
		File file2 = new File(fileName);
		FileOutputStream fileOutputStream = null;
		BufferedOutputStream bos = null;
		try {
			fileOutputStream = new FileOutputStream(file2);

			bos = new BufferedOutputStream(fileOutputStream);
			bos.write(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (fileOutputStream != null) {
				try {
					fileOutputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		doCompress(file2, 400, 400, 1.0f, fileName, true);
		
		// FileWriter fileWriter=new
		// FileInputStream fileInputStream=new FileInputStream(null);
		return null;
	}

}
