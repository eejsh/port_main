package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.NoticeVo;
import model.UserVo;


@Service
public class ServiceInfo implements Service1{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "query";

	@Override // 회원가입 
	public void insert(UserVo uservo) throws Exception {
		sqlSession.insert(namespace + ".insert", uservo);
	}

	@Override	 //출력 + pageing 
	public List<NoticeVo> notiAll(int pagelimit, int pageno) throws Exception {
	
		int pageing = (pagelimit * pageno ) - pagelimit;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageing", Integer.toString(pageing));
		map.put("pagelimit", Integer.toString(pagelimit));
		
	   List<NoticeVo> notilist = sqlSession.selectList(namespace +".nselect", map);
		
		return notilist;
	}

	
	//noti 전체 페이지 
	@Override
	public int npage(int pagelimit) throws Exception {      
	 int pgno = sqlSession.selectOne(namespace+".npages", pagelimit);
		return pgno;
	}
	
	//공지사항 검색 (제목만.. )
	@Override
	public List<NoticeVo> notisearch(String nokey) throws Exception {
	
	List<NoticeVo> notilist = sqlSession.selectList(namespace+".nosearch", nokey);
		
	return notilist;
	}
	
	
	

}
