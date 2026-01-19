package model;

public class DiaryDto {

	private int bno;
	private String userid;
	private String content;
	private String imgfile;
	private String regdate;
	

    // 회원 정보 포함
    private MemberDto member;  // MemberDto 객체를 담음

    
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
    public MemberDto getMember() { return member; }
    public void setMember(MemberDto member) { this.member = member; }
}
	
