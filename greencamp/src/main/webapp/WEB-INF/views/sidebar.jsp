<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='cssmenu'>
			<ul>
				<li class='active has-sub'><a href='listCampBsnm.pi'><span>캠핑장</span></a>
					<ul>
					<!-- campController -->
						<li><a href='mypageresvecamplist.pi'><span>예약캠핑장</span></a></li>
					</ul></li>
				<!-- commentController -->
				<!-- bbsController -->
				<li class='active has-sub'><a href='#'><span>게시판</span></a>
					<ul>
						<li><a href='mypagereplylist.pi'><span>작성댓글</span></a></li>
						<li><a href='mypagebbslist.pi'><span>작성게시글</span></a></li>
					</ul></li>
				<!-- messageController -->
				<li class='active has-sub'><a href='#'><span>쪽지함</span></a>
					<ul>
						<li><a href='mypagereceptionlist.pi'><span>수신함</span></a></li>
						<li><a href='mypagesendlist.pi'><span>발신함</span></a></li>
						<li><a href='mypagesendmsg.pi'><span>쪽지쓰기</span></a></li>
					</ul></li>
				<!-- memberController -->
				<li class='active has-sub'><a href='#'><span>회원정보</span></a>
					<ul>
						<li><a href='mypageshowmemberinfo.pi'><span>회원정보보기</span></a></li>
						<li><a href='mypagememberinfoupdate.pi'><span>회원정보수정</span></a></li>
						<li><a href='mypageoutmember.pi'><span>회원탈퇴</span></a></li>
					</ul></li>
			</ul>
		</div>