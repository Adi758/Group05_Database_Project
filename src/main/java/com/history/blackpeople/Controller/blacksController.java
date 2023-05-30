package com.history.blackpeople.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.history.blackpeople.Model.Items;
import com.history.blackpeople.Model.Users;
import com.history.blackpeople.Service.blacksService;

@Controller
public class blacksController {
    
    @Autowired
    private blacksService service;
    
    int pageSize = 4;

    @GetMapping(value={"/login", "/"})
    public String login(){
        return "Login.jsp";
    }

    @GetMapping("/signup")
    public String signup(){
        return "Signup.jsp";
    }
    
    @RequestMapping("/register")
    public String register(@ModelAttribute Users user){
        user.setUserType("NA");
        System.out.println("sent to adduser service");
        service.addUser(user);
        return "Login.jsp";
    }

    @RequestMapping("/loginValidation")
    public String loginValidation(Model model, String email, String password){

        String message = "";
        Users user = service.validateUser(email,password);
        if(user==null){
            message = message+"Invalid Credentials, Try Again...!!!";
            System.out.println("message is "+message);
            return "Login.jsp";
        }
        else{
            message.concat("Welcome to the world of history of Black People");
            model.addAttribute("user", user);
            System.out.println("model -> "+model);
            return "/adminDashboard";
        }
    }
    
    
    @RequestMapping(value={"/adminDashboard/{offSet}"})
    public String adminDashboard(@PathVariable int offSet, Model model) {

    	System.out.println("searched word is ->"+model.getAttribute("searchedWord"));
    	System.out.println("off set ->"+ offSet);
    	
    	List<Items> items = service.findAllItemsWithPagination(offSet, pageSize).toList();
    	
    	if(model.getAttribute("searchedWord")!=null) {
    		items = service.findSearchedItemsWithPagination(service.findAllItems(), model.getAttribute("searchedWord")+"");
    		if(items.size()>pageSize) {
    			model.addAttribute("buttonCode", service.getPageNumbersCodeforSearched(items.size(), pageSize, model.getAttribute("searchedWord")+""));
    			
    			items = items.subList((offSet*pageSize), ((offSet*pageSize)+pageSize)<items.size()?((offSet*pageSize)+pageSize):items.size());
    		}
    		else
    			model.addAttribute("buttonCode", service.getPageNumbersCode(items.size(), pageSize));
    	}
    		model.addAttribute("path", "../");
    	
    	model.addAttribute("items", items);
        model.addAttribute("offSet", offSet);
    	
		return adminDashboard(model);
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("/adminDashboard")
	public String adminDashboard(Model model){
    	
    	System.out.println("Offset is ----->>>>>>> "+model.getAttribute("offSet"));
    	 int offSet = 0;
    	if(model.getAttribute("searchedWord")!=null) {
    		List<Items> items = (List<Items>) model.getAttribute("items");
    		System.out.println("searched items size ->"+ items.size());
    	}
    	else
    		model.addAttribute("buttonCode", service.getPageNumbersCode(service.findAllItems().size(), pageSize));
    	if(model.getAttribute("items")==null) {
    		List<Items> items = new ArrayList<>();
    		if(service.findAllItems().size()>=4)
    			items = service.findAllItems().subList(0, pageSize);
    		else
    			items = service.findAllItems();
    		
    		model.addAttribute("fileDisplayCode", service.loadFilesByItems(items, model.getAttribute("offSet")));
    		model.addAttribute("buttonCode", service.getPageNumbersCode(service.findAllItems().size(), pageSize));
    		System.out.println("Outsideeeeeeeee");
    	}
    	else {
    		System.out.println("insisdeeeeeeeeeeeee");
    		List<Items> items = (List<Items>) model.getAttribute("items");
    		model.addAttribute("fileDisplayCode", service.loadFilesByItems(items, model.getAttribute("offSet")));
    	}
    	
        String test = "";
        if(model.getAttribute("path")!=null)
        	test = test+model.getAttribute("path");
          
        return test+"AdminDashboard.jsp";
    }


    public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/webapp/resources";

    @RequestMapping("/uploaded")
    public String uploaded(Model model, @RequestParam("itemName") MultipartFile itemName, @RequestParam("itemCaption") String itemCaption){

        Items item = new Items();
        item.setItemName(itemName.getOriginalFilename());
        item.setItemCaption(itemCaption);

        // adding item uploaded into database
        model.addAttribute("message", service.saveFileuploaded(item));

        System.out.println(uploadDirectory);
        // Copying the file uploaded into our resources folder
        Path fileNameAndPath = Paths.get(uploadDirectory, item.getItemName());
        try {
			Files.write(fileNameAndPath, itemName.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        return adminDashboard(model);
    }

    @RequestMapping(value={"/searched","/searched/{offSet}"})
    public String searched(Model model, String searchedWord, @PathVariable int offSet) {
    	
    	System.out.println("Searched word issss -------------->>"+searchedWord);
    	
    	model.addAttribute("searchedWord", searchedWord);
    	model.addAttribute("offSet", offSet);
    	if(searchedWord!=null) {
    		model.addAttribute("items", service.findBySearchedWord(searchedWord));
    		System.out.println("Images inside Searched ->>>>>>>>"+service.findBySearchedWord(searchedWord));
    	}
    	
    	System.out.println("Indiseee searcheddddd ->>>"+offSet);
    	return adminDashboard(offSet,model);
	}
    
    @RequestMapping("/deleted")
    public String deleted(Model model,@RequestParam("itemName") String fileName) {
    	System.out.println("Delete controller indisde  ->>>>>"+fileName);
    	
    	service.removeFile(fileName);
    	
    	return adminDashboard(model);
    }
    
    @RequestMapping("/documents/{offSet}")
    public String documents(Model model, @PathVariable int offSet) {
    	
    	return searched(model, ".doc", 0);
    }
    
    @RequestMapping("/PDFs/{offSet}")
    public String PDFs(Model model, @PathVariable int offSet) {
    	
    	return searched(model, ".pdf", 0);
    }

    @RequestMapping("/images/{offSet}")
    public String images(Model model, @PathVariable int offSet) {
    	model.addAttribute("items", service.getAllImages());
    	model.addAttribute("searchedWord", ".pn");
    	model.addAttribute("offSet", offSet);
    	model.addAttribute("path", "../");
//    	return searched(model, ".pn", 0);
    	return adminDashboard(model);
    }
    
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
}
