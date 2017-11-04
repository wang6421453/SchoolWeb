package com.wl.school.common.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

/**
 * 验证码生成工具类
 * @author wl
 *
 */
public class AuthCodeUtils {

	//使用到Algerian字体，系统里没有的话需要安装字体，字体只显示大写，去掉了1,0,i,o几个容易混淆的字符
	public static final String AUTH_CODE = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
	/**
     * 使用系统默认字符源生成验证码
     * @param authCodeSize    验证码长度
     * @return
     */
	public static String generateAuthCode(int authCodeSize){
		return generateAuthCode(authCodeSize, AUTH_CODE);
	}
	
	/**
     * 使用指定源生成验证码
     * @param authCodeSize    验证码长度
     * @param sources   验证码字符源
     * @return
     */
	public static String generateAuthCode(int authCodeSize, String sources){
		if(sources == null || sources.length() == 0){
			sources = AUTH_CODE;
		}
		int codesLen = sources.length();
		Random rand = new Random(System.currentTimeMillis());
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < authCodeSize; i++){
			sb.append(sources.charAt(rand.nextInt(codesLen - 1)));
		}
		return sb.toString();
	}
	
	/**
     * 输出指定验证码图片流
     * @param w
     * @param h
     * @param os
     * @param code
     * @throws IOException
     */
	public static void outputImage(int width, int height, OutputStream os, String code) throws IOException{
		int codeSize = code.length();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Random random = new Random();
		Graphics2D g = image.createGraphics();
		g.setColor(getRandColor(200,250));  
        g.fillRect(0, 0, width, height);
        //创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Times New Roman", Font.PLAIN, height-1);
        //设置字体。
        g.setFont(font);

        //随机产生155条干扰线，使图象中的认证码不易被其它程序探测到  
        g.setColor(getRandColor(160,200));  
        for (int i=0;i<155;i++ )  
        {  
         int x = random.nextInt(width);  
         int y = random.nextInt(height);  
                int xl = random.nextInt(12);  
                int yl = random.nextInt(12);  
         g.drawLine(x,y,x+xl,y+yl);  
        }
        char[] chars = code.toCharArray();
        for(int i = 0; i < codeSize; i++){
        	// 将认证码显示到图象中  
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(String.valueOf(chars[i]), 13*i+6, 23);
        }
         
        g.dispose();
        ImageIO.write(image, "jpg", os);
    }
	
	/**
     * 随机产生颜色
     * @param fc
     * @param bc
     * @return
     */
	private static Color getRandColor(int fc, int bc) {
		Random random = new Random();  
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
     
}
