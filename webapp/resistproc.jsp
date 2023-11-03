<!-- 회원가입처  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.model.MemberDAO" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>회원가입</title>
</head>
<body>
 <%
            // 한글 인코딩 처리
            request.setCharacterEncoding("euc-kr");
        %>
        
        <b>회원가입 정보를 확인하세요.</b>
        <br/><br/>
        
        <!-- 자바빈 액션태그 사용 -->
        <jsp:useBean id="memberBean" class="main.bean.MemberBean" />
        <jsp:setProperty name="memberBean" property="*" />
 
        <%
            // 회원가입을 처리할 DAO클래스의 객체를 생성한다.
            MemberDAO dao = MemberDAO.getInstance();
        
            // 회원정보를 담고있는 memberBean 객체를 DAO클래스로 전달한다.
            dao.joinMember(memberBean);
        %>
        
        <b>회원가입이 되었습니다.</b><br>
        
        <b><%=memberBean.getId() %></b>님의 회원정보입니다. <br/><br/>
        

</body>
</html>