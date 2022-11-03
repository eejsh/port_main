package controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.UserVo;
import service.Service1;


@RestController
public class JoinController {

	@Inject
	Service1 service;
	
	@RequestMapping("/write.do") // 저장 , 아이디 중복체크 별도로 없음. 
	public void joinss(UserVo uservo, HttpServletResponse res ){ 
	res.setContentType("text/html; charset=utf-8");
	PrintWriter pw = null;
	
	try {
		pw = res.getWriter();
		service.insert(uservo);
		
		pw.print("<script>alert('회원가입 되었습니다.');"
				+ "location.href='../port_main';</script>");
		
	}catch (Exception e) {
		System.out.println(e.getMessage());
		pw.print("<script>alert('실패하였습니다.관리자에게 문의해 주시기 바랍니다.');"
				+ "location.href= history.go(-1); </script>");
	}
	
	}

}
