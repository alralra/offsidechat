<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Action</title>
</head>
<body>
    <%
    
        String userID = request.getParameter("userID");
        String password = request.getParameter("userPassword");

        String dbURL = "jdbc:mysql://localhost:3306/mysql";
        String dbUser = "root"; // 설정된 id
        String dbPassword = "subin11188"; // 설정된 password

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try { 
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT * FROM userJoin WHERE userID=? AND userPassword=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('good ') ;</script>");
                out.println(userID+"님 환영합니다.");
                
            } else {
            	out.println("<script>alert('fail');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
    
        if(userID != null && userID.equals(password)){ // userID의 값을 확인하고
        	session.setAttribute("userID", userID); // 일치한다면, session에 저장
        }
        out.println(userID+"님 환영합니다.");    
        response.sendRedirect("main.jsp"); // 완료 후 index.jsp 페이지로 이동
    %>
    
    
    <%
    out.println(userID+"님 환영합니다.");
    %>
    
    
    
    
</body>
</html>