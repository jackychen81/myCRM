package com.myCRM.tools;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.core.convert.converter.Converter;

public class MyDateConverter implements Converter<String, Date> {
	private static final List<String> formarts = new ArrayList<String>(4);
	static {
		formarts.add("yyyy-MM");
		formarts.add("yyyy-MM-dd");
		formarts.add("yyyy-MM-dd hh:mm");
		formarts.add("yyyy-MM-dd hh:mm:ss");
	}

	public Date convert(String source) {
		String value = source.trim();  
        if ("".equals(value)) {  
            return null;  
        }  
        if(source.matches("^\\d{4}-\\d{1,2}$")){   
            return parseDate(source, formarts.get(0));  
        }else if(source.matches("^\\d{4}-\\d{1,2}-\\d{1,2}$")){  
            return parseDate(source, formarts.get(1));  
        }else if(source.matches("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}$")){  
            return parseDate(source, formarts.get(2));  
        }else if(source.matches("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}:\\d{1,2}$")){  
            return parseDate(source, formarts.get(3));  
        }else {  
            throw new IllegalArgumentException("Invalid boolean value '" + source + "'");  
        } 
	}
	
	public  Date parseDate(String dateStr, String format) {  
        Date date=null;  
        try {  
        	SimpleDateFormat dateFormat = new SimpleDateFormat(format);  
            date = (Date) dateFormat.parse(dateStr);  
        } catch (Exception e) {  
        }  
        return date;  
    }

}
