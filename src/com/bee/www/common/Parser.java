package com.bee.www.common;

public class Parser {

    public static String chgToStr(String str){
        str=str.replaceAll("&","&amp;");
        str=str.replaceAll("<","&lt;");
        str=str.replaceAll(">","&gt;");
        str=str.replaceAll("'","&#039;");
        str=str.replaceAll("\"","&quot");
        return str;
    }
    public static String strToHTML(String str){
        str=str.replaceAll("&amp;","&");
        str=str.replaceAll("&lt;","<");
        str=str.replaceAll("&gt;",">");
        str=str.replaceAll("&#039;","'");
        str=str.replaceAll("&quot","\"");
        return str;
    }

}
