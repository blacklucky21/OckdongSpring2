<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.frm {
	margin-left: 250px;
}

a:link, a:visited {
	text-decoration: none;
	color: #656565;
}
ㄴ


.board_list {
	width: 100%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_list thead th:first-child {
	background-image: none
}

.board_list thead th {
	border-bottom: 1px solid #ccc;
	padding: 12px 0 13px 0;
	color: #3b3a3a;
	vertical-align: middle
}

.board_list tbody td {
	border-top: 1px solid #ccc;
	padding: 10px 0;
	text-align: center;
	vertical-align: middle
}

.board_list tbody tr:first-child td {
	border: none
}

.board_list tbody td.title {
	text-align: left;
	padding-left: 20px
}

.board_list tbody td a {
	display: inline-block
}

.board_view {
	width: 85%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_view tbody th {
	text-align: left;
	background: #f7f7f7;
	color: #3b3a3a
}

.board_view tbody th.list_tit {
	font-size: 13px;
	color: #000;
	letter-spacing: 0.1px
}

.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {
	border-bottom: none
}

.board_view tbody th, .board_view tbody td {
	padding: 15px 0 16px 16px;
	border-bottom: 1px solid #ccc
}

.board_view tbody td.view_text {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 45px 18px 45px 18px
}

.board_view tbody th.th_file {
	padding: 0 0 0 15px;
	vertical-align: middle
}

.wdp_90 {
	width: 90%
}

.btn {
	border-radius: 3px;
	padding: 5px 11px;
	color: black !important;
	display: inline-block;
	background-color: #6b9ab8;
	border: 1px solid #56819d;
	vertical-align: middle;
	border-color: black;
}
</style>

</head>
<body>
	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp"/>

	<form class="frm">
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.TITLE }1</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }1</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }asd</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }2019-22-52</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }wwwwwwwwwwwwwwwwwwwwwww</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS }내용입니다.</td>
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="85%">
			</colgroup>
			<tbody>
				<tr>
					<th>댓글</th>
					<td>ㅁㄴㅁㄴㅁㄴㅁㄴㅁㄴㅁㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</td>
				</tr>
				<tr>
					<td style="background: #f7f7f7; color: #3b3a3a;">아이디
						<p style="font-size: 8px;">시간</p>
					</td>
					<td><input type="hidden" value="" id="com_IDX">
						<div id="com_Div">
							<input type="hidden" value="" id="">
						</div>
						<div align="right">
							<a href="#this" name="com_Del" class="btn" style="font-size:10px;">삭제</a> <a href="#this"
								name="com_Mod" class="btn" style="font-size:10px;">수정</a>
						</div></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<textarea rows="5" cols="130" name="COM_CONTENTS" style="margin-left: 50px"></textarea>
							<p align="right">
								<a href="#this" id="com_write" class="btn">등록</a>
							</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</form>


	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../footer/footer.jsp"/>



</body>
</html>