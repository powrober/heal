<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 열람 페이지</title>

<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script> 


<script type="text/javascript">
	$(function() {
		
		/* hideReplyForm(); */  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		hideBlameForm1();  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		hideBlameForm2();  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		
		
		//jquery ajax 로 해당 게시글에 대한 댓글 조회 요청
		//해당 게시글의 번호를 전송함
		var bid = ${ board.bid };//el 의 값을 변수에 대입
		var loginUser = "${ sessionScope.loginUser.nick }"; //로그인한 회원 아이디 변수에 대입
		$.ajax({
		url : "${ pageContext.request.contextPath }/brlist.do",
		type : "post",
		data : { b_ref_bid : bid }, //전송값에 변수 사용
		dataType : "json",
		success : function(data) {
			console.log("success : " + data);
			//object ==> string
			var jsonStr = JSON.stringify(data);
			//string ==> json 
			var json = JSON.parse(jsonStr);
			var values = "";
			for ( var i in json.list) {
				//본인이 등록한 댓글일 때는 수정/삭제 가능하게 함
/* 				if (loginUser == json.list[i].b_rwriter) {
					values += "<table align='center' width='700' border='0' cellpadding='2'>"
							+ "<tr>"
							+ "<td bgcolor='white'>"
							+ "<table class='table2'>"
							+ "<tr>"
							+ "<td width='200px'><"+ json.list[i].b_rwriter"> 님 댓글</td>"
							+ "<td width='500px'>"	+ json.list[i].b_create_date "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2' width='200px'>"
							+ "<form action='rupdate.do' method='post'>"
							+ "<input type='hidden' name='b_rid' value='" +  json.list[i].b_rid  + "'>"
							+ "<input type='hidden' name='bid' value='${board.bid}'>"
							+ "<textarea name='b_rcontent' rows='2' cols='70'>"
							+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ") "</textarea><br>"
							+ "<input type='submit' value='수정' style='width:50px;float:right;'></form>"
							+ "</tr>"
							+ "<button onclick='replyDelete("+ json.list[i].b_rid+ ");' style='width:50px;float:right;margin-right:10px'>삭제</button>"
							+ "</table></td></tr></table>";
				} else { //본인 댓글이 아닐 때
 					values += "<table align='center' width='700' border='0' cellpadding='2'>"
 							+ "<tr>"
							+ "<td bgcolor='white'>"
							+ "<table class='table2'>"
							+ "<tr>"
							+ "<td width='200px'><"+ json.list[i].b_rwriter"> 님 댓글</td>"
							+ "<td width='500px'>"	+ json.list[i].b_create_date "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2' width='200px'>"
							+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ") 
							+ "<button onclick='showBlamForm2();' style='float:right'>신고</button>"
							+ "</td></tr></table></td></tr></table>"; */
							if (loginUser == json.list[i].bruser) {
								values 	+= "<article class='comment'><div class='comment-body'><div class='comment-header'><p class='comment-title'>"+ json.list[i].bruser
										+ "님 댓글</p><time class='comment-time' datetime='2019'>"	+ json.list[i].br_date
										+ "</time></div><div class='comment-text'><form action='brupdate.do' method='post'>"
										+ "<input type='hidden' name='brid' value='"+  json.list[i].brid  + "'>"
										+ "<input type='hidden' name='bid' value='${board.bid}'>"
										+ "<textarea name='brcontent' rows='2' cols='70'>"
										+ decodeURIComponent(json.list[i].brcontent).replace(/\+/gi, " ")
										+ "</textarea><div class='comment-footer'><input type='submit' value='수정' style='width:50px;float:right;'><button onclick='replyDelete("+ json.list[i].brid+ ");' style='width:50px;float:right;margin-right:10px'>삭제 </button></div></form></div></div></article>";
								} else { 
			 					values += "<article class='comment'><div class='comment-body'><div class='comment-header'><p class='comment-title'>"+ json.list[i].bruser
										+ "님 댓글</p><time class='comment-time' datetime='2019'>"+ json.list[i].br_date
										+ "</time></div><div class='comment-text'><p>"
										+ decodeURIComponent(json.list[i].brcontent).replace(/\+/gi, " ") 
										+ "</p></div><div class='comment-footer'></div></div></article>";
						}
			} //for in
			$("#rlistTbl").html($("#rlistTbl").html() + values);
			
		}, // success
		
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		} // 에러
		
	}); //notice top3 ajax
}); //jquery document ready
	function replyDelete(brid) {
		location.href = "${ pageContext.request.contextPath }/brdel.do?brid="
				+ brid + "&bid=${ board.bid }";
	}
	function showReplyForm() {
		$("#replyDiv").css("display", "block");
	}
	
	function hideReplyForm() {
		$("#replyDiv").css("display", "none");
	} 
	function showBlamForm1() {
		$("#blameDiv1").css("display", "block");
	}
	
	function hideBlameForm1() {
		$("#blameDiv1").css("display", "none");
	}
	function showBlamForm2() {
		$("#blameDiv2").css("display", "block");
	}
	
	function hideBlameForm2() {
		$("#blameDiv2").css("display", "none");
	}
	
</script>

<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


</head>
<body>
	
	<c:import url="../main/header.jsp" />

	<div style="text-align: center; padding-top: 10px;">
		<div>
			<h4 style="margin: 20px 0 10px 0;">${ board.btitle }</h4>
		</div>
	</div>
				
	<br>

	<table align="center" cellpadding="2" cellspacing="0" width="1000" style="width: 1000px;">
		<tr>
			<td bgcolor=white>
				<table class="table2">
					<tr>
						<td width="150px">말머리</td>
						<td width="350px">${ board.btype }</td>
						<td width="150px">작성자</td>
						<td width="350px">${ board.buser } 님</td>
					</tr>
					<tr>
						<td width="250px">작성일</td>
						<td width="250px">${ board.b_date }</td>
						<td width="250px">조회수</td>
						<td width="250px">${ board.bcount } 뷰</td>
					</tr>
					<tr>
						<td width="250px">첨부파일</td>
						<td width="500px"  colspan='3'>
							<c:if test="${ empty board.b_file }">첨부파일 없음</c:if>
							<c:if test="${ !empty board.b_file }">
								<c:url var="bfd" value="/bfdown.do">
									<c:param name="ofile" value="${ board.b_file }" />
									<c:param name="rfile" value="${ board.b_rfile }" />
								</c:url>
							<a href="${ bfd }">${ board.b_file }</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td width="500px" height="200" colspan='4'>
							<c:if test="${ empty board.b_file }">${ fn:replace(board.bcontent, cn, br) }</c:if>
							<c:if test="${ !empty board.b_file }">
								<c:url var="bfd" value="/bfdown.do">
									<c:param name="ofile" value="${ board.b_file }" />
									<c:param name="rfile" value="${ board.b_rfile }" />
								</c:url>
							<img src="/me/resources/board_files/${ board.b_file }" style="width:500px;"><br>${ fn:replace(board.bcontent, cn, br) }
							</c:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tfoot>
          <td colspan="4" style="text-align: right;">
          
          
        	<%-- 관리자가 로그인 했을일 때  --%>
			
			<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'admin' }">
				<c:url var="abuv" value="/adminbupview.do">
					<c:param name="bid" value="${ board.bid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ abuv }'">수정</button> &nbsp; &nbsp;
							 
				<c:url var="bdl" value="/bdelete.do">
					<c:param name="bid" value="${ board.bid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bdl }'">글삭제</button> &nbsp; &nbsp;
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'">목록</button>
			</c:if> 
		  
          
          	<%-- 작성자가 게시글을 볼 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nick eq board.buser }">
			<c:url var="buv" value="/bupview.do">
					<c:param name="bid" value="${ board.bid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ buv }'">수정</button> &nbsp; &nbsp;
							 
				<c:url var="bdl" value="/bdelete.do">
					<c:param name="bid" value="${ board.bid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bdl }'">글삭제</button> &nbsp; &nbsp;
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'">목록</button>
			</c:if> 
	      
    		
			<%-- 일반회원이 게시글을 볼 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nick ne board.buser and loginUser.user_lv eq 'MEMBER' }">
							
				<%-- <c:url var="boardBlame" value="/b.blame.insert.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				
			<button type="button" onclick="showBlamForm1();">신고</button> &nbsp; &nbsp; --%>
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'">목록</button>
			</c:if> 
			
			
			<%-- 비로그인일때 --%> 
			<c:if test="${ empty sessionScope.loginUser }">  
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href= '${ bls }'">목록</button>
			</c:if>
				
			</td>
		</tfoot>
	</table>

		<%-- 게시글 신고하기 폼 영역  
			<div id="blameDiv1" style="padding-bottom: 30px; padding-top: 20px;">
				<form action="b.blame.insert.do" method="post">
					<input type="hidden" name="blame_bid" value="${ board.bid }">
					<table align=center width=700 border=0 cellpadding=2>
					
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color=white>게시글 신고</font></td>
						</tr>
					
						<tr>
							<td bgcolor=white>
								<table class="table2">
									<tr>
										<td width="200px">신고유형</td>
										<td width="500px"><select type="test" name="blame_type">
														  <option value="부적절">부적절</option>
														  <option value="욕설">욕설</option>
														  <option value="사기">사기</option>
														  <option value="음란물">음란물</option>
														  </select></td>
									</tr>
								
									<tr>
										<td width="200px">작성자</td>
										<td width="500px"><input type="text" name="reporter" readonly value="${ sessionScope.loginUser.nick }"></td>
									</tr>
									
									<tr>
										<td width="200px">신고대상</td>
										<td width="500px"><input type="text" name="targetuser" readonly value="${ board.buser }"></td>
									</tr>
									
									<tr>
										<td width="200px">내 용</td>
										<td width="500px"><textarea name="blame_content" rows="5" cols="50"></textarea></td>
									</tr>
									
									<tr>
										<th colspan="2" style="text-align: right;">
										<input type="submit" value="신고">&nbsp;
										<input type="reset" value="신고취소"  onclick="hideBlameForm1(); return false;"></th>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>		--%>
	
	
		<%-- <%-- 게시글 신고하기 폼 영역 
			<div id="blameDiv2" style="padding-bottom: 30px;">
				<form action="b.blame.insert.do" method="post">
					<input type="hidden" name="blame_bid" value="${ board.bid }">
					<table align="center" width="700" border="0" cellpadding="2">
					
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color=white>댓글 신고</font></td>
						</tr>
					
						<tr>
							<td bgcolor=white>
								<table class="table2">
									<tr>
										<td width="200px">신고유형</td>
										<td width="500px"><select type="test" name="blame_type">
														  <option value="부적절">부적절</option>
														  <option value="욕설">욕설</option>
														  <option value="사기">사기</option>
														  <option value="음란물">음란물</option>
														  </select></td>
									</tr>
								
									<tr>
										<td width="200px">작성자</td>
										<td width="500px"><input type="text" name="reporter" readonly value="${ sessionScope.loginUser.nick }"></td>
									</tr>
									
									<tr>
										<td width="200px">신고대상</td>
										<td width="500px"><input type="text" name="targetuser" readonly value="${ board.buser }"></td>
									</tr>
									
									<tr>
										<td width="200px">내 용</td>
										<td width="500px"><textarea name="blame_content" rows="5" cols="50"></textarea></td>
									</tr>
									
									<tr>
										<th colspan="2" style="text-align: right; padding-top: 20px;">
										<input type="submit" value="신고">&nbsp;
										<input type="reset" value="신고취소"  onclick="hideBlameForm2(); return false;"></th>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>		 --%>
			
			
	<section class="section section-lg bg-default" style="padding-top: 0px;padding-bottom: 0px;" id="rlistView">
        <div class="container container-wide">
          <div class="row justify-content-sm-center">
            <div class="col-lg-10 col-xl-8 col-xxl-6 sections-collapsable single-post-wrap">
              <div class="section-md" style="padding-top: 0px;">
                <p class="h3-alternate">Comments</p>
                <div class="comment-group" id="rlistTbl">
                 
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      
      <%-- 로그인한 상태일 때 댓글달기 사용하게 함 --%> 
			<c:if test="${ !empty loginUser }">
			
				<%-- 댓글달기 폼 영역 --%>
				<br>
				<div id="replyDiv" style="padding-bottom: 10px; padding-top: 10px;">
					<form action="brinsert.do" method="post">
						<input type="hidden" name="b_ref_bid" value="${ board.bid }">
						<table align="center" width="700" border="0" cellpadding="2">
						
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color="white">댓글작성</font></td>
						</tr>
						
						
							<tr>
								<td bgcolor=white>
									<table class="table2">
										
										<tr>
											<td width="200px">작성자</td>
											<td width="500px"><input type="text" name="bruser" readonly value="${ sessionScope.loginUser.nick }"></td>
										</tr>
										
										<tr>
											<td width="200px">내 용</td>
											<td width="500px"><textarea name="brcontent" rows="5" cols="60"></textarea></td>
										</tr>
										
										<tr>
											<td colspan="2"  style="text-align: right;">
											<input type="submit" value="댓글등록">&nbsp;
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:if> 
			

	<jsp:include page="../main/footer.jsp" />

</body>
</html>