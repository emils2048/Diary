package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;

public class ReplyDao {

	public void ReplyInsert(ReplyDto dto) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into diaryreply (reply_bno,diary_bno,userid,replytext) values (diaryrp_seq.nextval,?,?,?)";

		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getDiary_bno());
			pstmt.setString(2,dto.getUserid());
			pstmt.setString(3,dto.getReplytext());
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
	
	public List<ReplyDto> ReplySelect(int diary_bno) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT w.diary_bno,w.reply_bno, w.userid, w.replytext, w.regdate, " +
				"m.username, m.profile " +
				"FROM diaryreply w JOIN diarymember m ON w.userid = m.userid " +
				"ORDER BY w.regdate DESC";
		
		List<ReplyDto> list = new ArrayList<ReplyDto>();
		
		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDto dto = new ReplyDto();
				dto.setDiary_bno(rs.getInt("diary_bno"));
				dto.setReply_bno(rs.getInt("reply_bno"));
				dto.setUserid(rs.getString("userid"));
				dto.setReplytext(rs.getString("replytext"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				MemberDto mdto = new MemberDto();

				mdto.setUsername(rs.getString("username"));
				mdto.setProfile(rs.getString("profile"));

				dto.setMember(mdto);
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		return list;
	}
	
	public void ReplyDelete(int reply_bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from diaryreply where reply_bno = ?";
		
		try {
			conn = DBManager.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply_bno);
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
