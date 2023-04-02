package com.seseokboard.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	// 공통사용 변수 (전역변수로 선언)
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// getCon() > DB연결에 관한 모든 처리 수행.
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds 
			=(DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		
		System.out.println("DAO: DB 연결 성공!(CP)");
		System.out.println("DAO: "+con);
		return con;
	}// getCon() method end
	
	// DB 연결 해제 (자원 해제)
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}// try-catch end
	}// closeDB() method end
	
	// 게시판 글쓰기
	public void insertBoard(BoardDTO dto) throws Exception{
		con = getCon(); // 쿼리문 DB 미반영 에러로 인한 주석처리

		String sql = "select MAX(bno) from board_review";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int bno = 0;
		if(rs.next()) {
			// bno가 존재할때
			bno = rs.getInt(1) +1;
			// bno가 NULL일때, getInt() 는 0을 리턴한다. > 1을 더해주면 첫번째 글이 된다.
			System.out.println("DAO: bno success, bno: "+ bno);
		}// if end // bno값을 설정하는 동작.
			// 글쓰기 동작 수행
			sql =
			"insert into board_review (bno,name,pass,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file)"
			+ " values (?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getReadCount());
			pstmt.setInt(7, bno);
			pstmt.setInt(8, dto.getRe_lev());
			pstmt.setInt(9, dto.getRe_seq());
			// date > sql문으로 삽입
			pstmt.setString(10,dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO: 글쓰기 동작 완료!");
			
			closeDB();
	}// insertBoard() method end
	
	//게시판 목록 가져오기
	public ArrayList getBoardList(int startRow, int pageSize) {
		ArrayList boardList = new ArrayList(); 
		try {
			// connection pool
			con = getCon();
			String sql
				= "select * from board_review"
						+ " order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow -1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("readcount"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setDate(rs.getDate("date"));
				dto.setIp(rs.getString("ip"));
				dto.setFile(rs.getString("file"));
				
				boardList.add(dto);
				//  DTO를 통하여 DB에서 전달받은 정보를 ArrayList 타입 변수 boardList에 저장.
			}// while end
			System.out.println("DAO: 게시판 글 정보 저장 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		} // t - c - f end
		return boardList;
	}// getBoardList() method end
	
	// 게시글의 수를 리턴하는 메서드
	public int getBoardCount() {
		int result = 0;
		try {
			con = getCon();
			String sql = "select count(*) from board_review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				// 글이 없는 게시판의 경우, count(*)은 0을 반환한다.
				System.out.println("DAO: 전체 글 개수 = "+result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
	}//getBoardCount() method end
	
	public BoardDTO getBoard(int bno) {
		BoardDTO dto = null;
		try {
			con = getCon();
			sql = "select * from board_review where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("readcount"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setDate(rs.getDate("date"));
				dto.setIp(rs.getString("ip"));
				dto.setFile(rs.getString("file"));
				
				System.out.println("DAO: dto에 "+bno+"번 글 정보 저장 완료!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}// tcf end
		return dto;
	}// getBoard() method end
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// BoardDAO class end
