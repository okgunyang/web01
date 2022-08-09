<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./img/favicon.ico">
    <link rel="apple-touch-icon" href="./img/favicon.ico">
    <!-- 검색(메타) 정보 -->
    <meta name="url" content="https://www.samsungdisplay.co.kr">
    <meta name="title" content="삼성디스플레이">
    <meta name="description" content="삼성디스플레이의 기업정보,제품정보,미디어,커뮤니티">
    <meta name="keywords" content="삼성디스플레이,HD,퀀텀">
    <!-- 오픈 그래프 -->
    <meta property="og:url" content="https://www.samsungdisplay.co.kr">
    <meta property="og:title" content="삼성디스플레이">
    <meta property="og:description" content="삼성디스플레이의 기업정보,제품정보,미디어,커뮤니티">
    <meta property="og:image" content="./img/logo-square-letter.png">
    <title>공지사항</title>
    <!-- 기본 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <!-- 웹 폰트/폰트 모듈 연결 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <style>
    @font-face {
        font-family: 'scB';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/SuncheonB.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    } 
    @font-face {
        font-family: 'ROKAF';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSlabSerifBold.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }   
    </style>
    <!-- 웹 아이콘 연결 -->
    <!-- XEIcon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <!-- 스타일 초기화 모듈 연결 -->
    <!-- <link rel="stylesheet" href="./css/reset.css"> -->
    <link rel="stylesheet" href="./css/normalize.css">
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="sub_common.css">
    <style>
    #page2 .tit_box { text-align:right; }    
    .sec_tit { font-size: 42px;    font-weight: 700;    line-height: 1.64;
    letter-spacing: -0.03em; padding-top: 2em; padding-bottom: 1em; }
    .tb1 { display:table; width: 100%; border-collapse: collapse; margin-bottom: 28px; }
    .tb1 tr { display:table-row; }
    .tb1 td, .tb1 th { display:table-cell; border-bottom:1px solid #666; 
    line-height: 3.6; }
    .tb1 tr:first-child th, .tb1 tr:first-child td { border-top:1px solid #666; }
    .tb1 th { background-color: #f6f5f4; width: 200px; font-weight:600; color:#222; }
    .tb1 td { color:#666; font-weight: 400; padding-left: 2em; }
    .para1 { padding-top: 2em; padding-bottom: 1em;  line-height: 2; font-size:18px; }
    .para2 { padding-top: 2em; padding-bottom: 1em;  line-height: 2; font-size:18px; 
    font-weight: 700; }

    .tb2 { display:table; width: 100%; border-collapse: collapse; margin-bottom: 28px; }
    .tb2 tr { display:table-row; }
    .tb2 td, .tb2 th { display:table-cell; border-bottom:1px solid #666; 
    line-height: 3.6; }
    .tb2 tr th { border-top:1px solid #666; }
    .tb2 th { background-color: #f6f5f4; font-weight:600; color:#222; }
    .tb2 td { color:#666; font-weight: 400; padding-left: 2em; }
    .tb2 th:first-child, .tb2 tr td:first-child { width:70px; text-align:center;}
    .tb2 th:last-child, .tb2 tr td:last-child { width:110px; text-align: center; 
    padding-left: 0; }
    .page_nation { clear:both; text-align: center; padding-top:0.5em; padding-bottom:4em; }
    </style>
<link rel="stylesheet" href="datatables.min.css">
<script src="datatables.min.js"></script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable();
});
</script>
</head>
<body>
<div class="container-full">
<header id="hd">
	<%@ include file="nav.jsp" %>
</header>
<div class="content" class="panel-body">
	<div class="container-fluid">
		<h2>회원목록</h2>
		<table class="table" id="myTable">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>	
<!-- DB 연결문 -->
<%@ include file="connectPool.conf" %>
<!-- 반복 실행 구간 시작 -->
<%
	sql = "select * from board";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
%>
			<tr>
				<td><%=rs.getInt("bno") %></td>
				<td><a href='boardDetail.jsp?bno=<%=rs.getInt("bno") %>'><%=rs.getString("btitle") %></a></td>
				<td><%=rs.getString("author") %></td>
			</tr>
 <!-- 반복 실행 구간 종료-->
 <%
	}
 %>
 <%@ include file="connectClose.conf" %>
 <!-- DB 닫기문 -->
 <% if(sid.equals("admin")) { %>
 				<tr>
 					<td colspan="3"><a href="boardInsert.jsp" class="btn btn-primary">글쓰기</a></td>
 				</tr>
 <% } %>
 			</tbody>
		</table>
	</div>
</div>
<footer id="ft">
	<%@ include file="ft.jsp" %>
</footer>
</div>
</body>
</html>