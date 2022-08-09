<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="hd_wrap">
    <a href="index.jsp" class="logo">
        <img src="./img/samsung_logo.svg" alt="로고">
    </a>
    <nav id="gnb">
        <ul>
            <li>
                <span>기업정보</span>
                <ul class="sub">
                    <li><a href="company.jsp#page1">기업개요</a></li>
                    <li><a href="company.jsp#page2">CEO 인사말</a></li>
                    <li><a href="company.jsp#page3">연혁</a></li>
                    <li><a href="company.jsp#page4">사업장 정보</a></li>
                    <li><a href="company.jsp#page5">전자공고</a></li>
                </ul>
            </li>
            <li>
                <span>제품정보</span>
                <ul class="sub">
                    <li><a href="product.jsp#page1">OLED Display</a></li>
                    <li><a href="product.jsp#page2">QD Display</a></li>
                </ul>
            </li>
            <li>
                <span>경영전략</span>
                <ul class="sub">
                    <li><a href="manage.jsp#page1">지속가능경영</a></li>
                    <li><a href="manage.jsp#page2">인권정책</a></li>
                    <li><a href="manage.jsp#page3">녹색경영</a></li>
                    <li><a href="manage.jsp#page4">사회공헌</a></li>
                </ul>
            </li>
            <li>
                <span>미디어센터</span>
                <ul class="sub">
                    <li><a href="media.jsp#page1">뉴스</a></li>
                    <li><a href="media.jsp#page2">소셜미디어</a></li>
                    <li><a href="media.jsp#page3">영상</a></li>
                </ul>
            </li>
            <li>
                <span>커뮤니티</span>
                <ul class="sub">
                    <li><a href="community.jsp#page1">채용정보</a></li>
                    <li><a href="community.jsp#page2">직무소개</a></li>
                    <li><a href="board1.jsp">공지사항</a></li>
                    <li><a href="community.jsp#page3">자료실</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <p id="tnb">
       	<%  
		String sid = (String) session.getAttribute("uid");
		String sname = (String) session.getAttribute("name");
		if(sid==null) {	//방문자
		%>
		<a href="login.jsp">로그인</a>
		<a href="">손님</a>
		<a href="agree.jsp">회원가입</a>
		<%
			} else if(!sid.equals("admin")){ //일반회원
		%>
		<a href="logout.jsp">로그아웃</a>
		<a href="mypage.jsp"><%=sname %></a>
		<a href="board1.jsp">게시판</a>
		<%
			} else {	//관리자
		%>
		<a href="mypage.jsp"><%=sname %></a>
		<a href="board1.jsp">게시판 관리</a>
		<a href="memberList.jsp">회원관리</a>
		<a href="">상품관리</a>
		<a href="logout.jsp">로그아웃</a>
		<span id="msg_a"></span>
		<%
			}
		%>
	</p>
	<script>
		//주소 입력줄로 받은 msg를 받아 출력하는 부분임
		var url = location.href;  //url입력줄의 메시지를 포함한 주소를 저장
		var pos = url.indexOf("?msg=");
		var msg = url.substr(pos+5); //메시지만 추출
		var msg_a = document.getElementById("msg_a"); //해당 msg_a 아이디 요소 선택
		//msg_a.innerHTML = decodeURI(msg);
		if(pos>0) {
			if(msg!=""){
				msg_a.innerHTML = msg;
				alert(msg);
			}
		}
	</script>
</div>
