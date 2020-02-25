package com.ineat.oxo.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.DBsetDAO;

@Controller
public class DBController {
	@Autowired
	DBsetDAO dbDAO;
	
	@RequestMapping("/dbMaster.eat")
	public ModelAndView dbForm(ModelAndView mv) {
		mv.setViewName("/db/dbMaster");
		
		return mv;
	}
	
	
	@RequestMapping("/dbProc.eat")
	public void dbSet() {
		   File path = new File("C:\\Users\\UserK\\Desktop\\pic");
	         File[] fullList = path.listFiles();
	         
	         if(fullList.length > 0) {
	            for(int i = 0; i<fullList.length; i++) {
	               String real = fullList[i].toString();
	               if(real.indexOf("1")!=-1) {
	               dbDAO.dbSet(real.substring(real.lastIndexOf("\\")+1));
	               }
	            }
	         }
	}
}
