package com.pack;

import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.http.Part;


public class FileManager {
    public static String saveUploadedFile(String projectLocation, Part p, String vehicleNumber){
        int i = p.getSubmittedFileName().lastIndexOf(".");
        String extName = p.getSubmittedFileName().substring(i);
        String fileName= "photos/"+vehicleNumber+extName;
        try{
            InputStream is = p.getInputStream();
            FileOutputStream fo = new FileOutputStream(projectLocation+"/"+fileName);
            byte[] arr = new byte[is.available()];
            is.read(arr);
            fo.write(arr);
            is.close();
            fo.close();
        }catch(Exception ex){}
        return fileName;
    }
}
