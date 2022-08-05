<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>test Admin</title>	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>


<style>
#container_box table { width:900px; } 
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		
<div id="container_box">
<h2>${memberview.userId }님의 회원정보</h2>

<div class="useridx">
	회원번호 : ${memberview.useridx}
</div>

<div class="userName">
	이름 : ${memberview.userName}
</div>

<div class="regDate">
	등록일자 : <fmt:formatDate value="${memberview.regDate}" pattern="yyyy-MM-dd" />
</div>

<div class="userPhon">
	전화번호 : ${memberview.userPhon}
</div>

<div class="userAddr">
	주소 : ${memberview.userAddr1} - ${memberview.userAddr2} - ${memberview.userAddr3}
</div>

<div class="userPass">
	비밀번호 : ${memberview.userPass}
</div>

<c:if test="${memberview.verify == 9}">
	회원등급 : 관리자
</c:if>
<c:if test="${memberview.verify == 1}">
	회원등급 : 일반회원
</c:if>
<hr>
<div>
<button type = "button" id = "membermodify" class = "btn btn-primary">회원정보 수정하기</button>
<button type = "button" id = "memberdelete" class = "btn btn-warning">회원정보 삭제하기</button>
</div>
</div>
</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>
</div>
</body>
<script type="text/javascript">

// 수정하기
$("#membermodify").click(function() {
	location.href = "/admin/goods/membermodify?useridx=${memberview.useridx}";
});


// 삭제하기
$("#memberdelete").click(function() {

	var result = confirm('정말로 회원을 삭제하시겠습니까?');

	if (result) {
		location.href = "/admin/goods/memberdelete?useridx=${memberview.useridx}";
	} else {
		alert("회원삭제가 취소 되었습니다.");
	}
});

</script>
</html>