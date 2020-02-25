package com.ineat.oxo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.MatdcupDAO;
import com.ineat.oxo.vo.MatdcupVO;

@Controller
@RequestMapping("/mat/")
public class Matdcup {
   @Autowired
   MatdcupDAO mdDAO;
   @RequestMapping("matdcup.eat")
   public ModelAndView matdcupForm(ModelAndView mv) {
      List mlist = mdDAO.matList();
      mv.addObject("MLIST", mlist);
      mv.setViewName("matdcup/matdcup");
      return mv;
      

   }
   
   @RequestMapping("matdcupWin.eat")
   @ResponseBody
   public int matdcupInsertCount(@RequestParam String winName) {
      int cnt = mdDAO.insertCount(winName);
   return cnt;
   
   }
   
   @RequestMapping("matdcupRanking.eat")
   @ResponseBody
   public List<MatdcupVO> showRanking() {
         List<MatdcupVO> list = mdDAO.getRanking();
   return list;
   }
}