package com.pack;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter {
    public static Date toDate(String str){
        Date d = null;
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MMMM-yyyy");
        try{
            d = fmt.parse(str);
        }
        catch(Exception ex){}
        return d;
    }
    public static String toString(Date d){
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MMMM-yyyy");
        String str = fmt.format(d);
        return str;
    }
    public static java.sql.Date toSqlDate(Date d){
        java.sql.Date dt = new java.sql.Date(d.getTime());
        return dt;
    }
    public static Date toUtilDate(java.sql.Date d){
        Date dt = new Date(d.getTime());
        return dt;
    }
}
