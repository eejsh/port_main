package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CsController  {

	@Autowired
	BasicDataSource dataSource;
	
	@RequestMapping("/cs")
	public String page(Model m, HttpServletRequest req)  {
	
		//HttpServletRequest req  선언해야 파라미터값 가져올 수 잇음.
		// view : 출력파트임 java 가 작동되서 파일 업로드 시킴!  
		//file upload..?
		
		String cate = req.getParameter("cate");
		
		String sql = null;
		
		
		try {
		
			Connection con = dataSource.getConnection();
			
			if(cate != null && cate != "") {
				sql = "select * from faq_board where faq_view='Y' and fcate = '"+cate+"' ";
			}else{
				sql = "select * from faq_board where faq_view='Y' limit 0, 5";
			}
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			//원래는 map 배열로 넣어서 출력해야됨. 
			ArrayList<Map<String, String>> faq = new ArrayList<Map<String, String>>();
			
			while(rs.next()) {
				
				Map<String, String> mp = new HashMap<String, String>();
				mp.put("inx", rs.getString("inx"));
				
				String msg= null;;
				switch(rs.getString("fcate")) {
				case "1":
				msg = "배송문의";
				break;
				
				case "2":
				msg = "반품/교환문의";
				break;
				
				case "3":
				msg = "상품문의";
				break;
				
				case "4":
				msg = "쿠폰내역";
				break;
				
				case "5":
				msg = "마일리지 내역";
				break;
				
				default:
					msg="자주묻는내용";
					break;
				
				}
				//mp.put("fcate", rs.getString("fcate"));
				mp.put("fcate", msg);
				mp.put("fwrite", rs.getString("fwrite"));
				mp.put("faq_qc", rs.getString("faq_qc"));
				mp.put("faq_aw", rs.getString("faq_aw"));
				mp.put("indate", rs.getString("indate"));
				
				faq.add(mp);
				
			}
			con.close();
			//닫아주면 로딩 빨라짐..
			//m.addAttribute("rows", rs.getString("ctn"));
			m.addAttribute("faq", faq);
			
		}catch (Exception e) {
			e.getMessage();
		}
		
		return "cs";
	}
	
}

//put으로 받으면 get,set 필요없음.. faq는 보여주기만 있으니 DAO 필요없음.
//상품 출력도 DAO 가 필요없음!
//map으로 넣어서 출력하세요
