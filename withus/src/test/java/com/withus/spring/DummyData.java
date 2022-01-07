package com.withus.spring;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

class DummyData {

	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // executeQuery(), SELECT 결과 
	int cnt = 0;           // executeUpdate(), DML 결과	

	// MySQL
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버 클래스
	public static final String URL = "jdbc:mysql://localhost:3306/withus";  // DB 서버 정보
	public static final String USERID = "root";   // DB 사용자 계정 정보
	public static final String USERPW = "1234";

	public static final String SQL_MEMBER_INSERT = 
			"INSERT INTO cf_user" + 
					"(user_id, user_name, user_phone, user_email, user_addr, user_gender, user_pw) " +
					"VALUES(?, ?, ?, ?, ?, ?, ?)";

	public static final String SQL_AUTH_INSERT = 
			"INSERT INTO auth" + 
					"(user_id, user_auth) " +
					"VALUES(?, ?)";

	public static final String [] IDS = {"ID01", "ID02", "ID03"};
	public static final String [] NAMES = {"user01", "member02", "admin03"};
	public static final String [] EMAILS = {"user01@mail.com", "member02@mail.com", "admin03@mail.com"};
	public static final String [] PHONES = {"010111122", "010222233", "010333344"};
	public static final String [] ADDRS = {"경기도", "서울", "강원도"};
	public static final String [] GENDER = {"남", "여"};
	public static final String [] PASSWORDS = {"1234","1235"};

	@Test
	void genData() {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERID, USERPW);

			// 테스트용 dummy 데이터 만들기
			pstmt = conn.prepareStatement(SQL_MEMBER_INSERT);

			int num = 30;
			Random rand = new Random();

			for(int i = 0; i < num; i++) {				
				pstmt.setString(1, String.format("ID%d", i));
				pstmt.setString(2, NAMES[rand.nextInt(NAMES.length)]);
				pstmt.setString(3, PHONES[rand.nextInt(PHONES.length)]);
				pstmt.setString(4, EMAILS[rand.nextInt(EMAILS.length)]);
				pstmt.setString(5, ADDRS[rand.nextInt(ADDRS.length)]);
				pstmt.setString(6, GENDER[rand.nextInt(GENDER.length)]);
				pstmt.setString(7, encoder.encode(PASSWORDS[rand.nextInt(PASSWORDS.length)]));
				cnt += pstmt.executeUpdate();
			}

			System.out.println(cnt + "개 의 회원 데이터가 INSERT 되었습니다");

			pstmt.close();

			// 권한
			pstmt = conn.prepareStatement(SQL_AUTH_INSERT);
			pstmt.setString(1, IDS[1]);
			pstmt.setString(2, "ROLE_MEMBER");
			pstmt.executeUpdate();

			pstmt.setString(1, IDS[2]);
			pstmt.setString(2, "ROLE_MEMBER");
			pstmt.executeUpdate();

			pstmt.setString(2, "ROLE_ADMIN");
			pstmt.executeUpdate();


		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}