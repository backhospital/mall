<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test</title>
</head>
<body>
<h2>${memberview.userId }님의 정보수정하기</h2>

<form method="post">
<label>회원등급</label>

<textarea rows="1" cols="5" name="verify">${memberModify.verify}</textarea>

<button type="submit">수정하기</button>

</form>


</body>
</html>