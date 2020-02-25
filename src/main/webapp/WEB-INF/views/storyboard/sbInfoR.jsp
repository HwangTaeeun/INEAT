<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<script type="text/javascript">
	$(function(){
		$('#form1').submit();
	});
</script>
</head>
<body>
	<form method="POST" action="/oxo/storyboard/storyBoardInfo.eat" id="form1">
		<input type="hidden" name="bno" value="${DATA.bno}">
		<input type="hidden" name="mid" value="${DATA.mid }">
	</form>
</body>
</html>