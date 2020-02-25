<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="/oxo/css/matdcup.css">

<body>

	<button type="button" class="startBtn btn btn-warning" id="start"><em>S T A R T</em></button>
	<div class="matdcupBack">
		<!-- 우승자 -->
		<div class="w3-row classVictory" id="victoryId">

			<div class="w3-col w3-container" style="width: 35%"></div>
			<div class="w3-col w3-container" style="width: 30%">
				<img class="w3-padding w3-round">
			</div>
			<div class="w3-col w3-container" style="width: 35%"></div>
		</div>




		<!-- 결승 -->
		<div class="w3-row w3-margin-bottom class2gang winner2" id="2gang">
			<div class="w3-col w3-container" style="width: 37.77777%"></div>
			<div class="w3-col w3-container" style="width: 25%">
				<img class="w3-padding w3-round w3-half"> <img class="w3-padding w3-round w3-half">
			</div>
			<div class="w3-col w3-container" style="width: 37.77777%"></div>
		</div>
		<!--4강-->
		<div class="w3-row w3-margin-bottom class4gang winner" id="4gang">
			<div class="w3-col w3-container" style="width: 16.66666%"></div>
			<div class="w3-col w3-container" style="width: 25%">
				<img class="w3-padding w3-round w3-half"> <img class="w3-padding w3-round w3-half">
			</div>
			<div class="w3-col w3-container" style="width: 16.66666%"></div>
			<div class="w3-col w3-container" style="width: 25%">
				<img class="w3-padding w3-round w3-half"> <img class="w3-padding w3-round w3-half">
			</div>
			<div class="w3-col w3-container" style="width: 16.66666%"></div>
		</div>


		<!-- 8강 -->
		<div class="w3-row w3-bottom w3-margin-bottom" id="8gang">
			<div class="w3-col w3-container" style="width: 25%;">
				<c:forEach begin="0" end="1" var="list" items="${MLIST}">
					<img src="/oxo/matdcupImg/${list.md_name}.jpg" id="${list.md_name}" class="w3-padding w3-round w3-half">
				</c:forEach>
			</div>
			<div class="w3-col w3-container" style="width: 25%">
				<c:forEach begin="2" end="3" var="list" items="${MLIST}">
					<img src="/oxo/matdcupImg/${list.md_name}.jpg" id="${list.md_name}" class="w3-padding w3-round w3-half">
				</c:forEach>
			</div>
			<div class="w3-col w3-container" style="width: 25%">
				<c:forEach begin="4" end="5" var="list" items="${MLIST}">
					<img src="/oxo/matdcupImg/${list.md_name}.jpg" id="${list.md_name}" class="w3-padding w3-round w3-half">
				</c:forEach>
			</div>
			<div class="w3-col w3-container" style="width: 25%">
				<c:forEach begin="6" end="7" var="list" items="${MLIST}">
					<img src="/oxo/matdcupImg/${list.md_name}.jpg" id="${list.md_name}" class="w3-padding w3-round w3-half">
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 모달 백 -->
	<div class="modalBack"></div>
	<div class="nGangClass">
			<span class="nGang"></span>
	</div>
	
	<div class="vsClass">
			<span><em>V S</em></span>
	</div>
	<!-- 매치창 -->
	<div class="match">
		<div class="matchImgg">
			<img>
			<h2 id="imageName1">이미지1</h2>
		</div>
		<div class="matchImgg">
			<img>
			<h2 id="imageName2">이미지2</h2>
		</div>
		<div class="btnMatch w3-right">
			<button type="button" class="btn btn-warning" id="goMain">메인으로
				가기</button>
			<button type="button" class="btn btn-warning" id="goSearch"></button>
			<button type="button" class="btn btn-warning" id="goRanking">맛드컵랭킹보기</button>
		</div>
	</div>
	
	
	<form id="searchForm" method="POST" action="/oxo/searchProc.eat">
		<input type="hidden" id="contents" name="contents">
	</form>
	
	<!-- 맛드컵랭킹리스트 -->
	<div class="ranking">
		<ul class="w3-ul w3-border" id="mList">
		</ul>
	</div>

	<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
	<script type="text/javascript" src="/oxo/js/pscript.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script type="text/javascript" src="/oxo/js/matdcupJS.js"></script>
</body>
</html>