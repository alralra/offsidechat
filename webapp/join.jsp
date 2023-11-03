<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="./css/join.css">
</head>
<body>
    <h1>회원가입 폼</h1>
    <form method="post" action="joinAction.jsp">
        <div class="form-group">
              <label for="userID">ID:</label>
        <input type="text" id="userID " name="userID" required>
        </div>

        <div class="form-group">
            <label for="userPassword">Password:</label>
        <input type="password" id="userPassword" name="userPassword" required>
        </div>

        <div class="form-group">
            <label for="userName">Name:</label>
        <input type="text" id="userName " name="userName" required>
        </div>

        <div class="form-group">
            <label for="userEmail">Email:</label>
        <input type="email" id="userEmail " name="userEmail" required>
        </div>

        <div class="form-group">
            <input type="submit" value="가입하기">
        </div>
    </form>
</body>
</html>