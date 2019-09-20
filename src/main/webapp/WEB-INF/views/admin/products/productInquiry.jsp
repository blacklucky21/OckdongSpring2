<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/admin/productInquiry.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript"
	src="resources/js/admin/productInquiry.js"></script>

<!-- js 끝 -->
</head>
<body>
	<div class="warp">
		<!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
		<div id="content">
			<!-- 전체 범위  -->
			<div class="content">
				<!-- nav 제외 범위 -->
				<!-- 상품 제목 -->
				<div class="page_title_wrap">
					<div class="page_tit">상품 문의</div>
				</div>
				<!-- 제목 끝 -->
				<div class="listContent">
					<div class="search_box search_field">
						<form class="search_form">
							<table class="tg">
								<tr>
									<th class="tg-0lax serarch_ti">처리상태</th>
									<th class="tg-0lax"><span> <select id="select_code">
												<option>답변대기</option>
												<option>답변완료</option>
										</select>
									</span></th>

									<td><input type="button" value="검색" class="bu" id="se"
										onclick="searchIn();"> <input type="button"
										value="초기화" class="bu" id="can" onclick="replyIn();">
									</td>
								</tr>

							</table>
						</form>
					</div>
				</div>
				<!--  -->

				<div class="content_bottom">
					<p>
						검색 결과 <span>${qnaList.size() }</span>건
					</p>
					<!-- 상품 번호 p_Id -->
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
								<thead>
									<tr>
										<th>선택</th>
										<th>No</th>
										<th>답변상태</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>문의유형</th>
										<th>작성자</th>
										<th>문의일시</th>
										<th>답변일시</th>
									</tr>
								</thead>
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
									<c:forEach var="i" items="${qnaList }" varStatus="num">
										<tr class="list" id="list${num.count }">
											<td><input type="radio" id="sel" name="sel"></td>
											<td class="pp" id="py">${i.qna_Id }</td>
											<c:if test="${i.qna_answer eq 'N'}">
												<td class="pp">답변대기</td>
											</c:if>
											<c:if test="${i.qna_answer eq 'Y'}">
												<td class="pp">답변완료</td>
											</c:if>
											<td class="pp"><input type="hidden" class="i_p_Id" value="${ i.p_Id }"/>${ i.p_Id }</td>
											<td class="pp">${ i.p_title }</td>
											<td class="pp">${ i.p_lunchType }</td>
											<td class="pp" id="user${num.count }"><input type="hidden" class="i_Qna_User" value="${ i.qna_user }"/>${ i.qna_user }</td>
											<input type="hidden" class="i_Qna_Content" value="${ i. qna_content }"/>
											<input type="hidden" class="i_Qna_Id" value="${ i.qna_Id }"/>
											<input type="hidden" class="i_answer_content" value="${ i.answer_content }"/>
											<input type="hidden" class="i_answer_Id" value="${ i.answer_Id }"/>
											
											
											
											<td class="pp"><input type="hidden" class="i_Qna_date" value="${ i.qna_createDate }"/>${i.qna_createDate }</td>
											<td class="pp"><input type="hidden" class="i_Qna_answer" value="${ i.qna_answerDate }"/>${i.qna_answerDate }</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 댓글 목록 가지고 온다.  -->

				<div class="answer">
					<div class="partition" id="inquiryInfoWrap">
						
						<div class="table_tit_area">
							<div class="table_tit">문의/답변 내역</div>
						</div>
						
						<!-- 이놈 부터 -->
				<!-- 		<div class="content_item_bx">
							<div id="inquiryDetail">
								<div class="inquiry_wrap">
									<div class="inquiry_head">

										<span class="register_name"></span> <span
											class="register_ymdt"></span>

										<div class="right_btn_wrap"></div>
									</div>
									<div class="inquiry_content"></div>
								</div>
							</div>
							<div class="inquiry_wrap reply" id="write_area"
								style="display: block;">
								<div class="reply_ico"></div>
								<div class="reply_content">
									<textarea placeholder="답변을 입력해주세요." id="inquiryReplyContent"></textarea>
								</div>
								<button class="reply_save_btn" id="inquiryReplySaveBtn">저장</button>
							</div>
						</div> -->
						
						
					</div>
				</div>
				
				
			</div>
		</div>



		<script type="text/javascript"
			src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script>
// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
		// 검색어 검색 한다.
		function searchIn(){
			var select_code = $("#select_code").val();

			$.ajax({
				url : "adminSearchQnA.do",
				data : {type:select_code},
				dataType : "json",
				success : function(data){
					console.log(data);
					if(data.length > 0){
						$(".list_content").html("");
						$(".countSpan").html(data.length);
						var count = 1;
						for(var i in data){
							$tr = $("<tr class='list' id='list" +count + "' onclick='afterSearch(\"list" + count + "\");'>");
							
							$tdRadio = $("<td><input type='radio' id='sel' name='sel'>");
							$tdNo = $("<td class='pp' id='py'>").text(data[i].qna_Id);
							$tdAnOk = "";
							
							if(data[i].qna_answer == 'Y'){
								$tdAnOk = $("<td class='pp'>").text("답변완료");
							}else{
								$tdAnOk = $("<td class='pp'>").text("답변대기");
							}
							
							$tdPId = $("<td class='pp'>").text(data[i].p_Id);
							
							$tdPT = $("<td class='pp'>").text(decodeURIComponent(data[i].p_title.replace(/\+/g, " ")));
							
							$tdPL = $("<td class='pp'>").text(decodeURIComponent(data[i].p_lunchType.replace(/\+/g, " ")));
							
							$tdUser = $("<td class='pp' id='user"+ count +"'>").html("<input type='hidden' class='i_Qna_User' value='" + decodeURIComponent(data[i].qna_user.replace(/\+/g,"")) + "'/> "+ decodeURIComponent(data[i].qna_user.replace(/\+/g,"")) +" </td>");                                    
							
							$tin1 = $("<input type='hidden' class='i_Qna_Content'>");
							$tin1.val(decodeURIComponent(data[i].qna_content.replace(/\+/g, "")));
							$tin2 = $("<input type='hidden' class='i_Qna_Id' value='"+ data[i].qna_Id+"'>");
							$tin3 = $("<input type='hidden' class='i_p_Id' value='"+ data[i].p_Id+"'>");
							$tin4 = $("<input type='hidden' class='i_answer_content' value='" + data[i].answer_content + "'>");
							$tin5 = $("<input type='hidden' class='i_answer_Id' value='" + data[i].answer_Id + "'>");
							
							
							$tdCD = $("<td class='pp'>").html("<input type='hidden' class='i_Qna_date' value='"+ data[i].qna_createDate +"'/>" + data[i].qna_createDate + "</td>");
						
							if(data[i].qna_answerDate == undefined){
								
								$tdAD = $("<td class='pp'>").html("<input type='hidden' class='i_Qna_answer' value='"+ data[i].qna_answerDate +"'/></td>");
							}else{
								$tdAD = $("<td class='pp'>").html("<input type='hidden' class='i_Qna_answer' value='"+ data[i].qna_answerDate +"'/>"+ data[i].qna_answerDate + "</td>");
							}
							
							count = count + 1;
							
							$tr.append($tdRadio);
							$tr.append($tdNo);
							$tr.append($tdAnOk);
							$tr.append($tdPId);
							$tr.append($tdPT);
							$tr.append($tdPL);
							$tr.append($tdUser);
							$tr.append($tin1);
							$tr.append($tin2);
							$tr.append($tin3);
							$tr.append($tin4);
							$tr.append($tin5);
							$tr.append($tdCD);
							$tr.append($tdAD);
							$(".list_content").append($tr);
							
							var div = $('.content_item_bx');
							div.remove();
							
						}
						
					}else{
						alert("검색 결과가 없습니다.");									
					}
				}, error : function(data){
					alert("검색 결과가 없습니다.");
				}
			});
			
			var div1 = $('.answer');
			var append1 = "";
			
			append1 += "<div class='partition' id='inquiryInfoWrap'>";
			append1 += "<div class='table_tit_area'>";
			append1 += "<div class='table_tit'>문의/답변 내역</div>";
			append1+= "</div>";
			append1 += "</div>";
			div1.html(append1);
		}
		
// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	

		// 검색후 답변 해줄거 찾는다.
		function afterSearch(me){
			var user= $('#' + me).find(".i_Qna_User").val();
			var content = $('#' + me).find(".i_Qna_Content").val();
			var date = $('#' + me).find(".i_Qna_date").val();
			
			var answer_createdate = $('#' + me).find(".i_Qna_answer").val(); // 날자
			var answer_content = $('#' + me).find(".i_answer_content").val();
			var answer_Id = $('#' + me).find(".i_answer_Id").val();
			
			var qna_Id = $('#' + me).find(".i_Qna_Id").val();
			var p_Id = $('#' + me).find(".i_p_Id").val();
			
			
			
		/* 	
			console.log(qna_Id);
			console.log(p_Id);
			console.log(answer_Id);
			
			console.log("검색후 출력 : " + answer_createdate);
			console.log("검색후 출력 : " + answer_content);
			
		 */	
		 console.log("검색후 출력 : " + answer_content);
			$('#' + me).find('#sel').prop('checked', true);
			
			var div = $('#inquiryInfoWrap');
			
			var append = "";
			
			append += "<div class='table_tit_area'>";
			append += "<div class='table_tit'>문의/답변 내역</div>";
			append += "</div>";
			append += "<div class='content_item_bx'>";
			append += "<div id ='inquiryDetail'>";
			append += "<div class='inquiry_wrap'>";
			append += "<div class='inquiry_head'>";
			append += "<span class='register_name'>" +user+ "</span><span class='register_ymdt'>"+ date +"</span>";
			append += "<div class='right_btn_wrap'></div>";
			append += "</div>";
			append += "<div class='inquiry_content'>"+ content +"</div>";
			append += "</div>";
			append += "</div>";
			append += "<div class='inquiry_wrap reply' id='write_area' style='display: block;'>";
			append += "<div class='reply_ico'></div>";
			// 답변을 안했을 경우 
			if(answer_createdate == "undefined"){
				append += "<div class='reply_content'><textarea placeholder='답변을 입력해주세요.' id='answer_content'></textarea>";
				append += "</div>";
				append += "<button class='reply_save_btn' id='SaveBtn' onclick='submitinsert("+ qna_Id +","+ p_Id +")'>저장</button>";
				append += "</div>";
				append += "</div>";
			}else{
				append += "<div class='answercontent'>";
				append += "<div class='inquiry_head'>";
				append += "<span class='register_name'>운영자 </span><span class='register_ymdt'>"+ answer_createdate +"</span>";;
				append += "</div>"
				append += "<div class='inquiry_content'>"+ answer_content +"</div>";
				append += "</div>";
				append += "</div>";
				append += "<button class='reply_save_btn' id='SaveBtn' onclick='updateAnswer("+ qna_Id +","+ p_Id +","+answer_Id+")'>수정</button>";
				append += "<button class='reply_save_btn' id='SaveBtn' onclick='deleteAnswer("+ answer_Id+ ","+ qna_Id+","+p_Id+")'>삭제</button>";
				append += "</div>";
				append += "</div>";
			}
			
			div.html(append);
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼		

// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
// 초기화 버튼
		function replyIn(){
			location.href="productInquiry.do";
		}
		
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼		

// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
	// 처음 화면에서 선택 한다.
		$('.list').click(function(event){
			console.log("list");
			var tr = $(this);
			var td = tr.children();
			
			
			var trNum = $(this).closest('tr').prevAll().length; 
			console.log('trNum : ' + trNum); // 행 번호 넘기기

			
			var user= $(this).find(".i_Qna_User").val();
			var content = $(this).find(".i_Qna_Content").val();
			var date = $(this).find(".i_Qna_date").val();
			var answer_createdate = $(this).find(".i_Qna_answer").val(); // 날자
			var answer_content = $(this).find(".i_answer_content").val();
			var qna_Id = $(this).find(".i_Qna_Id").val();
			var p_Id = $(this).find(".i_p_Id").val();
			var answer_Id = $(this).find(".i_answer_Id").val();
			
		
			console.log("리스트 댓글 번호 : " + answer_content);
			console.log("리스트 댓글 번호 : " + qna_Id);
			console.log("답변 번호  : " + answer_Id);
			
			
			
			if(event.target.type !== 'radio'){
				$(':radio',this).trigger('click');
			}
			
			var div = $('#inquiryInfoWrap');
			
			var append = "";
			
			append += "<div class='table_tit_area'>";
			append += "<div class='table_tit'>문의/답변 내역</div>";
			append += "</div>";
			append += "<div class='content_item_bx'>";
			append += "<div id ='inquiryDetail'>";
			append += "<div class='inquiry_wrap'>";
			append += "<div class='inquiry_head'>";
			append += "<span class='register_name'>" +user+ "</span><span class='register_ymdt'>"+ date +"</span>";
			append += "<div class='right_btn_wrap'></div>";
			append += "</div>";
			append += "<div class='inquiry_content'>"+ content +"</div>";
			append += "</div>";
			append += "</div>";
			append += "<div class='inquiry_wrap reply' id='write_area' style='display: block;'>";
			append += "<div class='reply_ico'></div>";
			// 답변을 안했을 경우 
			if(answer_content == ""){
				
			append += "<div class='reply_content'><textarea placeholder='답변을 입력해주세요.' id='answer_content'></textarea>";
			append += "</div>";
			append += "<button class='reply_save_btn' id='SaveBtn' onclick='submitinsert("+ qna_Id +","+ p_Id +")'>저장</button>";
			append += "</div>";
			append += "</div>";
			
			}else{
				append += "<div class='answercontent'>";
				append += "<div class='inquiry_head'>";
				append += "<span class='register_name'>운영자 </span><span class='register_ymdt'>"+ answer_createdate +"</span>";;
				append += "</div>"
				append += "<div class='inquiry_content' id='an"+ trNum +"'>"+ answer_content +"</div>";
				append += "</div>";
				append += "</div>";
				append += "<button class='reply_save_btn' id='SaveBtn' onclick='updateAnswer("+ qna_Id +","+ p_Id +","+ answer_Id+ ", \""+answer_content+"\")'>수정</button>";
				append += "<button class='reply_save_btn' id='SaveBtn' onclick='deleteAnswer("+ answer_Id + ","+qna_Id+","+ p_Id +")'>삭제</button>";
				append += "</div>";
				append += "</div>";
				
				console.log("처음 화면에서 수정 댓글 : " + qna_Id);
				console.log("처음 화면에서 수정 게시판 : " + p_Id);
				console.log("처음 화면에서 답변 한 말 : " + answer_content);
				
			}
			div.html(append);
		}); 
		
		
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼			
		

// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	// 답글 달아주기
		function submitinsert(qna_Id, p_Id, answer_Id){
			
			var answer_content = $('#answer_content').val();
			console.log(answer_content);
			
			var qna_Id = qna_Id;
			var p_Id = p_Id;
			var answer_Id =$('.i_answer_Id').val();
			
			
			
			console.log("댓글 번호  : " + qna_Id);
			console.log("상품 번호  : " + p_Id);
			
			
			$.ajax({
				url:"addAnswer.do",
				data:{answer_content:answer_content,qna_Id:qna_Id, p_Id:p_Id},
				type:"post",
				dataType:"json",
				success:function(data){
						
						console.log("oh my god");
						console.log(data);
						console.log(data.qna_user);

						var div = $('#inquiryInfoWrap');
						
						var append = "";
						
						append += "<div class='table_tit_area'>";
						append += "<div class='table_tit'>문의/답변 내역</div>";
						append += "</div>";
						append += "<div class='content_item_bx'>";
						append += "<div id ='inquiryDetail'>";
						append += "<div class='inquiry_wrap'>";
						append += "<div class='inquiry_head'>";
						append += "<span class='register_name'>" + decodeURIComponent(data.qna_user.replace(/\+/g, " ")) + "</span><span class='register_ymdt'>"+ data.qna_createdate +"</span>";
						append += "<div class='right_btn_wrap'></div>";
						append += "</div>";
						append += "<div class='inquiry_content'>"+ decodeURIComponent(data.qna_content.replace(/\+/g, " ")) +"</div>";
						append += "</div>";
						append += "</div>";
						append += "<div class='inquiry_wrap reply' id='write_area' style='display: block;'>";
						append += "<div class='reply_ico'></div>";
						
						append += "<div class='answercontent'>";
						append += "<div class='inquiry_head'>";
						append += "<span class='register_name'>운영자 </span><span class='register_ymdt'>"+ data.answer_createdate +"</span>";;
						append += "</div>"
						
						append += "<div class='inquiry_content' >"+ decodeURIComponent(data.answer_content.replace(/\+/g, " ")) +"</div>";
						append += "</div>";
						append += "</div>";
						append += "<button class='reply_save_btn' id='SaveBtn' onclick='updateAnswer("+ qna_Id +","+ p_Id +","+ answer_Id +")'>수정</button>";
						append += "<button class='reply_save_btn' id='SaveBtn' onclick='deleteAnswer("+answer_Id+","+ p_Id +","+qna_Id+")'>삭제</button>";
						append += "</div>";
						append += "</div>";
						
						
						div.html(append);
						
						getupdateList(qna_Id, data.answer_createdate);
				}
			});
			
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼			
		
		
// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲		
		// 답변 달리면 list 에서 타입을 변경 해준다.
		function getupdateList(qna_Id ,qna_answerDate){
			console.log("list 타입 update 할 댓글 번호 : " + qna_Id);
			console.log("list 타입 update 할 댓글 번호 : " + qna_answerDate);
		
			$.ajax({
				url:"updateQnaType.do",
				data:{qna_Id:qna_Id,qna_answerDate:qna_answerDate},
				dataType:"json",
				success:function(data){
					console.log(data);
					
				}
			});
			
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	

// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
		// 답변 수정 버튼 
		function updateAnswer(qna_Id, p_Id, answer_Id, answer_content){
			//var answer_content = $("").val();
		
			console.log("수정 버튼 누리면 나올거 : "+qna_Id);
			console.log("수정 버튼 누리면 나올거 : "+p_Id);
			console.log("수정 버튼 누리면 나올거 답변 번호 : "+answer_Id);
			
			var div = $('.answercontent');
			
			var append = "";
			
			
			append += "<div class='reply_content'><textarea  id='answer_content'>"+ answer_content +"</textarea>";
			append += "</div>";
			append += "<button class='reply_save_btn' id='SaveBtn' onclick='AnswerUpdate("+ qna_Id +","+ p_Id +","+answer_Id+")'>저장</button>";
			
				
			div.html(append);
			
			
		}
		
// ==========================================================		
		
		function AnswerUpdate(qna_Id, p_Id, answer_Id){
		
			var answer_content = $('#answer_content').val();
	
			console.log("AnswerUpdate 눌림 : " +  qna_Id);
			console.log("AnswerUpdate 눌림 : " +  p_Id);
			console.log("AnswerUpdate 눌림 : " +  answer_content);
		
			$.ajax({
				url:"AnswerUpdate.do",
				data:{answer_Id:answer_Id,answer_content:answer_content, qna_Id:qna_Id, p_Id:p_Id},
				type:"post",
				dataType:"json",
				
				success:function(data){
					
					var div = $('#inquiryInfoWrap');
					
					var append = "";
					
					append += "<div class='table_tit_area'>";
					append += "<div class='table_tit'>문의/답변 내역</div>";
					append += "</div>";
					append += "<div class='content_item_bx'>";
					append += "<div id ='inquiryDetail'>";
					append += "<div class='inquiry_wrap'>";
					append += "<div class='inquiry_head'>";
					append += "<span class='register_name'>" + decodeURIComponent(data.qna_user.replace(/\+/g, " ")) + "</span><span class='register_ymdt'>"+ data.qna_createdate +"</span>";
					append += "<div class='right_btn_wrap'></div>";
					append += "</div>";
					append += "<div class='inquiry_content'>"+ decodeURIComponent(data.qna_content.replace(/\+/g, " ")) +"</div>";
					append += "</div>";
					append += "</div>";
					append += "<div class='inquiry_wrap reply' id='write_area' style='display: block;'>";
					append += "<div class='reply_ico'></div>";
					
					append += "<div class='answercontent'>";
					append += "<div class='inquiry_head'>";
					append += "<span class='register_name'>운영자 </span><span class='register_ymdt'>"+ data.answer_createdate +"</span>";;
					append += "</div>"
					
					append += "<div class='inquiry_content' >"+ decodeURIComponent(data.answer_content.replace(/\+/g, " ")) +"</div>";
					append += "</div>";
					append += "</div>";
					append += "<button class='reply_save_btn' id='SaveBtn' onclick='updateAnswer("+ qna_Id +","+ p_Id +","+answer_Id+")'>수정</button>";
					append += "<button class='reply_save_btn' id='SaveBtn' onclick='deleteAnswer("+answer_Id+","+ p_Id +","+qna_Id+")'>삭제</button>";
					append += "</div>";
					append += "</div>";
					
					
					div.html(append);
					
					getupdateList(qna_Id, data.answer_createdate);
				}
			});
			 
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼			
		
// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲		
		// 삭제 버튼 눌리면
		function deleteAnswer(answer_Id, qna_Id, p_Id){
			console.log("삭제 버튼 : "  + answer_Id);
			var key = confirm("상품 문의글을 임의로 삭제 하시면 컴플레인을 당할 수 있습니다. 계속 진행하시겠습니까?");
			
			
			console.log("삭제 버튼 눌림222: "  + p_Id);
			console.log("삭제 버튼 눌림111: "  + qna_Id);
			
			
			if(!key){
				alert("삭제를 취소 하였습니다.");
			}else{
				$.ajax({
					url:"deleteAnswer.do",
					data:{answer_Id:answer_Id},
					type:"post",
					success:function(data){
						if(data == "success"){
							
							var answer_content = $('.inquiry_content').val();
							
						
							var div = $('.answercontent');
							
							var append = "";
							
							
							append += "<div class='reply_content'><textarea  id='answer_content'>"+ answer_content +"</textarea>";
							append += "</div>";
							
							append += "<button class='reply_save_btn' id='SaveBtn' onclick='submitinsert("+ qna_Id +","+ p_Id +")'>저장</button>";	
							div.html(append);
							
							
							getupdateQna(qna_Id);
						}
					}
				});
			}
			
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼		

// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
		// 답글 삭제시 답변 여부와 시간 지운다.
		function getupdateQna(qna_Id){
			
			console.log("삭제 로 넘어온 값 : " + qna_Id);
			
			$.ajax({
				url:"updateQnaType2.do",
				data:{qna_Id:qna_Id},
				dataType:"json",
				success:function(data){
					
				}
			});
		}
// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼		
		
		
	</script>
	</div>
</body>
</html>