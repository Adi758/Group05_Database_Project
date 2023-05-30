package com.history.blackpeople.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.history.blackpeople.Model.Items;
import com.history.blackpeople.Model.Users;
import com.history.blackpeople.Repository.ItemsRepo;
import com.history.blackpeople.Repository.UsersRepo;

@Service

public class blacksService {


    public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/webapp/resources";
    File folder = new File(uploadDirectory);
    File[] files = folder.listFiles();
    
    @Autowired
    private UsersRepo URepo;

    @Autowired
    private ItemsRepo IRepo;
    
    
    public String loadFilesByItems(List<Items> items, Object object) {
    	String fileDisplayCode = "<ul id='files' class='grid-container'>\n";
    	String path = "";
    	if(object!=null)
    		path = path+"../";
    	
    	for(Items item: items) {
    		fileDisplayCode = fileDisplayCode.concat("<li class='grid-item'>\n"
            		+ "<a href='"+path+"resources/"+item.getItemName()+"' target='_blank'>"+item.getItemName()+"</a>\n"
            				+ "<p>"+item.getItemCaption()+"</P>\n"
            						+ "<form action='/deleted' method='post'>\n"
            						+ "<input type='hidden' name='itemName' value='"+item.getItemName()+"'>\n"
            						+ "<input type='submit' value='X'>\n"
            						+ "</form>\n"
            				+ "</li>\n");
    	}
    	fileDisplayCode = fileDisplayCode.concat("<ul>\n");
    	
    	return fileDisplayCode;
    }
    
    public String loadFiles(){
    System.out.println("folder path -> "+folder);
    System.out.println("Files length -> "+files.length);
    
    String fileDisplayCode = "<ul id='files' class='grid-container'>\n";

    for (File file: files){
        Items item = IRepo.findByitemName(file.getName());
        fileDisplayCode = fileDisplayCode.concat("<li class='grid-item'>\n"
        		+ "<a href='resources/"+item.getItemName()+"' target='_blank'>"+item.getItemName()+"</a>\n"
        				+ "<p>"+item.getItemCaption()+"</P>\n"
        				+ "</li>\n");
    }
    fileDisplayCode = fileDisplayCode.concat("<ul>\n");
    
	return fileDisplayCode;
}

    public List<Items> loadFiles(String searchedWord) {
    	
    	@SuppressWarnings("unchecked")
		List<Items> items = (List<Items>) new Items();
    	
    	for(File file: files) {
    		if(file.getName().toLowerCase().contains(searchedWord.toLowerCase())) {
    			items.add(IRepo.findByitemName(file.getName()));
    		}
    	}
    	
    	return items;
	}
    

    public void addUser(Users user) {
        URepo.save(user);
        System.out.println("User saved successfully");
    }

    public Users validateUser(String email, String password){
        Users user = URepo.findByemail(email);
        if(user.getPassword().equals(password))
            return user;
        else
            return null;        
    }


    public String saveFileuploaded(Items item){
        System.out.println("inside the save file upload service...");

        if(IRepo.save(item)!=null) {
        	return "File Uploaded Successfully";
        }
        else
        	return "File Upload Failed, Try again...!!!";
    }

    public Page<Items> findAllItemsWithPagination(int offSet, int pageSize){
    	Page<Items> items =  IRepo.findAll(PageRequest.of(offSet, pageSize));
		return items;
    }
    

    public List<Items> findBySearchedWord(String searchedWord){
    	
    	return IRepo.findBySearchedWord(searchedWord);
    }
    
    public List<Items> findAllItems(){
    	return IRepo.findAll();
    }

	public List<Items> findSearchedItemsWithPagination(List<Items> items, String searchedWord) {
		List<Items> searchedItems = new ArrayList<>();
		for(Items item: items) {
			if(item.getItemName().toLowerCase().contains(searchedWord.toLowerCase())) {
				searchedItems.add(item);
			}
		}
		return searchedItems;
	}
	
	public String getPageNumbersCodeforSearched(int size, int pageSize, String searchedWord) {
		int noOfPages = (size/pageSize);		
		if((size%pageSize)==0)
			return buttonCodeSearched(noOfPages, searchedWord);
		else
			return buttonCodeSearched(noOfPages+1, searchedWord);
	}
	
	public String buttonCodeSearched(int noOfPages, String searchedWord) {
		String pageNoCode = "<form action='/searched/5' method='post' id='test'>\r\n"
				+ "        <input type='hidden' name='searchedWord' value='"+searchedWord+"'/>\r\n"
				+ "      </form>\n";
		for(int i=1;i<=noOfPages;i++) {
			pageNoCode = pageNoCode.concat("<form action='/searched/"+(i-1)+"' method='post' >\n"
					+ "<input type='hidden' name='searchedWord' value='"+searchedWord+"'/>\n"
							+ "<button type='submit'>"+i+"</button>\n"
									+ "</form>\n");
		}
		return pageNoCode; 
	}

	public String getPageNumbersCode(int size, int pageSize) {
		int noOfPages = (size/pageSize);		
		if((size%pageSize)==0)
			return buttonCode(noOfPages);
		else
			return buttonCode(noOfPages+1);
		
	}
	
	public String buttonCode(int noOfPages) {
		String pageNoCode = "";
		for(int i=1;i<=noOfPages;i++) {
			pageNoCode = pageNoCode.concat("<a href='/adminDashboard/"+(i-1)+"'>"+i+"</a>\n");
		}
		return pageNoCode;
	}

	public void removeFile(String fileName) {
		
		File deleteFile = new File(folder+"/"+fileName);
		System.out.println("deleted file issssss ->>>>>>>"+deleteFile.getName());
		deleteFile.delete();
			
		IRepo.delete(IRepo.findByitemName(fileName));
		
	}

	public List<Items> getAllImages() {
		List<Items> items = IRepo.findBySearchedWord(".jp");
		items.addAll(IRepo.findBySearchedWord(".pn"));
		
		return items;
	}
	
}
