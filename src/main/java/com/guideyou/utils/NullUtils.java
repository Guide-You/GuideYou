package com.guideyou.utils;

import java.util.List;

/**
 * @FileName : NullUtils.java
 * @Project : GuideYou
 * @Date : 2024. 2. 20.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 :
 */
public class NullUtils {
	
	/**
	  * @Method Name : isNull
	  * @작성일 : 2024. 2. 20.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 객체가 null이면 true 반환
	  */
	public static boolean isNull(Object obj) {
		return obj == null;
	}
	
    /**
      * @Method Name : isNotNull
      * @작성일 : 2024. 2. 20.
      * @작성자 : 최장호
      * @변경이력 : 
      * @Method 설명 : 객체가 not null이면 true 반환
      */
    public static boolean isNotNull(Object obj) {
        return obj != null;
    }
    
    /**
      * @Method Name : isNullOrEmpty
      * @작성일 : 2024. 2. 20.
      * @작성자 : 최장호
      * @변경이력 : 
      * @Method 설명 : 리스트가 null 또는 빈값이면 true
      */
    public static boolean isNull(List<?> list) {
        return list == null || list.isEmpty();
    }
	
    /**
      * @Method Name : isNullOrEmpty
      * @작성일 : 2024. 2. 21.
      * @작성자 : 최장호
      * @변경이력 : 
      * @Method 설명 : String 값 null 또는 빈값이면 true
      * todo : 
      */
    public static boolean isNull(String str) {
        return str == null || str.isEmpty();
    }
}
