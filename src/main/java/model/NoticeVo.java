package model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class NoticeVo {
	
private String idx;
private String output;
private String subject;
private String writer;
private String upfile;
private String content;
private String indate;

}
