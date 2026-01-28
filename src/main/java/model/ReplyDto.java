package model;

public class ReplyDto {

	private int reply_bno;
	private int diary_bno;
	private String userid;
	private String replytext;
	private String regdate;
	
	private MemberDto member;
	
	public MemberDto getMember() {
		return member;
	}
	public void setMember(MemberDto member) {
		this.member = member;
	}
	public int getReply_bno() {
		return reply_bno;
	}
	public void setReply_bno(int reply_bno) {
		this.reply_bno = reply_bno;
	}
	public int getDiary_bno() {
		return diary_bno;
	}
	public void setDiary_bno(int diary_bno) {
		this.diary_bno = diary_bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
