package service;

import java.util.List;

import model.NoticeVo;
import model.UserVo;

public interface Service1 {

	// 회원가입
	public void insert(UserVo uservo) throws Exception;
	
	// notice 출력
	public List<NoticeVo> notiAll(int pagelimit , int pageno) throws Exception;

	// notice 전체 확인
	public int npage(int pagelimit) throws Exception;
	
	// noti 검색
	public List<NoticeVo> notisearch(String nokey) throws Exception;
	
	
	
	
}
