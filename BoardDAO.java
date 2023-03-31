package com.itwillbs.board.boardReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds
		= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		
		return con;
	} // getCon() method end
	
	public void closeDB() {
		try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		} catch (SQLException e) {
			System.out.println("DAO: closeDB() Error!");
			e.printStackTrace();
		}
	}// closeDB() method end
	
	public void insertBoard(BoardDTO dto) throws Exception{
		con = getCon();
		String sql = "select MAX(bno) from board_review";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		int bno=0;
		if(rs.next()) {
			bno = rs.getInt(1) +1;
			
		}// if end
		
		sql 
		= "insert into board_review (bno,name,pass,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, bno );
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getPass());
		pstmt.setString(4, dto.getSubject());
		pstmt.setString(5, dto.getContent());
		pstmt.setInt(6, dto.getReadcount());
		pstmt.setInt(7, bno);
		pstmt.setInt(8, 0);
		pstmt.setInt(9, 0);
		pstmt.setString(10, dto.getIp());
		pstmt.setString(11, dto.getFile());
		
		pstmt.executeUpdate();		
		System.out.println("글쓰기 완료!");
		
		closeDB();
		
	}//insertBoard method end
	
	public ArrayList getBoardList(int startRow, int pageSize) throws Exception {
		ArrayList boardList = new ArrayList();
		try{
			con = getCon();
			String sql = "select * from board_review"
					+ " order by re_ref desc, re_seq asc limit ?,?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow -1);
			pstmt.setInt(2, pageSize);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setDate(rs.getDate("date"));
				dto.setIp(rs.getString("ip"));
				dto.setFile(rs.getString("file"));
				
				boardList.add(dto);
			}//while end
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return boardList;
		
	}// getBoardList() method end
	
	public int getBoardCount() {
		int result = 0;
		try {
			con = getCon();
			sql = "select count(*) from board_review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
	} // getBoardCount() method end
	
	public BoardDTO getBoard(int bno) {
		BoardDTO dto = null;
		try {
			con = getCon();
			sql="select * from board_review where bno=?";
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBno(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReadcount(rs.getInt(6));
				dto.setRe_ref(rs.getInt(7));
				dto.setRe_lev(rs.getInt(8));
				dto.setRe_seq(rs.getInt(9));
				dto.setDate(rs.getDate(10));
				dto.setIp(rs.getString(11));
				dto.setFile(rs.getString(12));
				
				System.out.println("DAO: "+bno+"번 글, 정보저장 완료!");
				
			}// if end
			
			
			}catch(Exception e) {
				
			}finally {
			
		}// t-c-f end
		
		
		return dto;
	}// getBoard() end
	

}// BoardDAO class end

















































