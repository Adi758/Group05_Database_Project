package javaFiles;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class listAllFiles{
    public static void main(String[] args) throws IOException {
        // Reading all the files from the specified folder
        String folderPath = "C:\\Users\\srika\\OneDrive\\Documents\\Projects\\Group05_Database\\resources";
        File folder = new File(folderPath);
        File[] files = folder.listFiles();

        // Writing into file, which displays list of files in the folder
        FileWriter newFile = new FileWriter("C:\\Users\\srika\\OneDrive\\Documents\\Projects\\Group05_Database\\Html\\ListOfFiles.html");
        newFile.write("<ul id='files' class='grid-container'>\n");

        for(File file:files){
            if(file.isFile()){
                newFile.write("<li class='grid-item'><a href='/resources/"+file.getName()+"' target='_blank'>"+file.getName()+"</a></li>\n");
                System.out.println("File -> "+file.getName());
            }
        }
        newFile.write("<ul>\n");
        newFile.close();
    }
}