package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;

public class DiaryDao {

	public void diaryInsert(DiaryDto dto) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into diarywrite (bno,userid,content,imgfile) "
				+ " values (diarywr_seq.nextval,?,?,?)";

		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImgfile());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public List<DiaryDto> diaryWriteSelect(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT w.bno, w.userid, w.content, w.imgfile, w.regdate, " +
				"m.username, m.profile " +
				"FROM diarywrite w JOIN diarymember m ON w.userid = m.userid " +
				"ORDER BY w.regdate DESC";


		List<DiaryDto> list = new ArrayList<DiaryDto>();

		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				DiaryDto dto = new DiaryDto();
				dto.setBno(rs.getInt("bno"));
				dto.setUserid(rs.getString("userid"));
				dto.setContent(rs.getString("content"));
				dto.setImgfile(rs.getString("imgfile"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));

				MemberDto mdto = new MemberDto();

				mdto.setUsername(rs.getString("username"));
				mdto.setProfile(rs.getString("profile"));

				dto.setMember(mdto);



				list.add(dto);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {

		}try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public DiaryDto getView(int bno) {

		DiaryDto dto = null;

		String sql =
				"select d.bno, d.userid, d.content, d.imgfile, d.regdate, " +
						"m.username, m.profile " +
						"from diarywrite d join diarymember m " +
						"on d.userid = m.userid " +
						"where d.bno = ?";


		try (Connection conn = DBManager.getInstance();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new DiaryDto();
				dto.setBno(rs.getInt("bno"));
				dto.setUserid(rs.getString("userid"));
				dto.setContent(rs.getString("content"));
				dto.setImgfile(rs.getString("imgfile"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));

				MemberDto m = new MemberDto();
				m.setUsername(rs.getString("username"));
				m.setProfile(rs.getString("profile"));

				dto.setMember(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void diaryUpdate(DiaryDto dto) {

		Connection conn = null;
		PreparedStatement pstmt = null;


		String sql = null;

		sql = "update diarywrite set content=?,imgfile=COALESCE(?,imgfile) "
				+ " where bno = ?";
		//COALESCE(값1, 값2)
		//값1이 NULL이면 값2 사용, 값1이 있으면 값1 사용

		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getImgfile());
			pstmt.setInt(3, dto.getBno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

		}try{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void diaryDelete(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from diarywrite where bno = ?";
		
		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
	}finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (Exception e2) {
			e2.printStackTrace();
		}
	}
		
  }
}