<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
if(data.length > 0){
					for(var i in data){
						
						var nick = $('#nick').val();
						$tr = $("<tr id='reply" + i + "'>");
						
						$pv_User = $("<td>").text(decodeURIComponent(data[i].pv_user.replace(/\+/g,"")));
						
						if(data[i].status != 'N'){
						$pv_content = $("<td class='tcontent'>").html("<span>" + decodeURIComponent(data[i].pv_reviewContent.replace(/\+/g,"")) + "</span>");                         
							
						}else{
						$pv_content = $("<td class='tcontent'>").html("<span> 삭제된 댓글 입니다. </span>");                         
							
						}
					
						$pv_createDate = $("<td>").text(data[i].pv_createDate);
						
						console.log("현재 닉네임 : " + "${loginUser.nickName}");
						console.log("댓글 번호 가지고 온다. : " + data[i].pv_Id);
						
						console.log(nick);
						
						if(decodeURIComponent(data[i].pv_user.replace(/\+/g,"")) == nick ){
							if(data[i].status != 'N'){
							$td = $("<td>").html("<button id='qwe" + i + "'' class='btn ctrl' onclick='updateRe("+ i + "," + data[i].pv_Id +");'>수정</button><button id='asd"+i+"' class='btn ctrl' onclick='deleteRe("+ data[i].pv_Id +");'>삭제</button>");
							}else{
							$td = $("<td>");
							}
						} else{
							$td = $("<td>");
						} 
						
						$tr.append($pv_User);
						$tr.append($pv_content);
						$tr.append($pv_createDate);
						$tr.append($td);
		
						
						$tableBody.append($tr);
						
					}
</body>
</html>