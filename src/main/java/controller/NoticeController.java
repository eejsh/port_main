package controller;

import javax.inject.Inject;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.Service1;

@Controller
public class NoticeController  {

	// 공지사항 
	
	@Inject
	Service1 service;
	

	@RequestMapping("/notice")
	public String noti_list(Model m, @RequestParam("pageno") @Nullable String pageno) throws Exception{
	
		int pagelimit = 10; 	//보여질 갯수 
		
		//page no가 null 일 시 
	   if(pageno == null) {
			pageno = "1";
		}
		m.addAttribute("notilist", service.notiAll(pagelimit, Integer.parseInt(pageno)));	
		m.addAttribute("pageno",pageno);
		m.addAttribute("totalpage", service.npage(pagelimit));
	
		return "notice";
	}
	
	//noti 검색  (제목만 검색)
	@RequestMapping("/nosearch")
	public String notisearch(Model m,@RequestParam("nokey") String nokey )
	throws Exception{
		
		m.addAttribute("notilist", service.notisearch(nokey));
		m.addAttribute("nokey", nokey);
				return "notice";
		
	}
	
}
