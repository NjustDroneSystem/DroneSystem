package com.droneSystem.util;

import java.text.SimpleDateFormat;
import java.util.Random;

public class UIDUtil {
	public static final SimpleDateFormat formater = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	public static final SimpleDateFormat formater1 = new SimpleDateFormat("yyyyMMdd");
	private static long LastCurrentTimeMillis = 0;	//最后一次获取字符串的时间
	/**
	 * 获取22位的ID字符串
	 * ID字符串规则：yyyyMMddHHmmssSSS_XXXX(XXXX为四位随机数)
	 * @return 22位的ID字符串
	 */
	public static String get22BitUID(){
		long currentTimeMillis = System.currentTimeMillis();
		if(currentTimeMillis <= LastCurrentTimeMillis){
			currentTimeMillis = LastCurrentTimeMillis + 10;	//往后延10ms
		}
		LastCurrentTimeMillis = currentTimeMillis;
		Random rand = new Random(currentTimeMillis);
		int randInt = rand.nextInt(10000);	//返回0~9999之间的随机数
		return String.format("%s_%04d", formater.format(new java.sql.Date(currentTimeMillis)), randInt);
	}
	/**
	 * 获取14位的ID字符串(清单号)
	 * ID字符串规则：yyyyMMddXXXXXX(XXXXXX为四位随机数)
	 * @return 14位的ID字符串
	 */
	public static String getBillCode(){
		long currentTimeMillis = System.currentTimeMillis();
		if(currentTimeMillis <= LastCurrentTimeMillis){
			currentTimeMillis = LastCurrentTimeMillis + 10;	//往后延10ms
		}
		LastCurrentTimeMillis = currentTimeMillis;
		Random rand = new Random(currentTimeMillis);
		int randInt = rand.nextInt(1000000);	//返回0~999999之间的随机数
		return String.format("%s%06d", formater1.format(new java.sql.Date(currentTimeMillis)), randInt);
	}
	
	/**
	 * 获取文件名
	 * @param prex：文件名前缀
	 * @return 文件名字符串：‘前缀’_yyyyMMddHHmmssSSS_XXXX
	 */
	public static String getFileNameUID(String prex){
		return String.format("%s_%s", prex==null?"":prex, get22BitUID());
	}
	
	public static void main(String []args){
		System.out.println(UIDUtil.get22BitUID());
		System.out.println(UIDUtil.getFileNameUID("Home"));
		System.out.println(UIDUtil.getBillCode());
	}
	
	/**
	 * 获取证书编号（Code）：[强检强检委托单号][3位序列号]-[3位版本号]，版本号从0开始，改后第一版为001，如版本号为0，则不需要后三位的版本号
	 * @param commissionSheetCode：强检强检委托单号
	 * @param sequence：序列号（第几份证书）
	 * @param version：版本号
	 * @return
	 */
	public static String getCertificateCode(String commissionSheetCode, int sequence, int version){
		if(sequence <= 0){
			sequence = 1;
		}
		if(version < 0){
			version = 0;
		}
		if(version == 0){
			return String.format("%s%03d", commissionSheetCode, sequence);
		}
		return String.format("%s%03d-%03d", commissionSheetCode, sequence, version);
	}
	/**
	 * 获取证书编号（Code）：[强检强检委托单号]-[3位版本号]，版本号从0开始，改后第一版为001，如版本号为0，则不需要后三位的版本号
	 * @param commissionSheetCode：强检强检委托单号
	 * @param sequence：序列号（第几份证书）
	 * @param version：版本号
	 * @return
	 */
	public static String getCertificateCode2(String commissionSheetCode, int version){
		
		if(version < 0){
			version = 0;
		}
		if(version == 0){
			return String.format("%s", commissionSheetCode);
		}
		return String.format("%s-%03d", commissionSheetCode, version);
	}
	
}
