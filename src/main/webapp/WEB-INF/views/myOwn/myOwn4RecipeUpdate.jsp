<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<title>Insert title here</title>
<style>
.lunch_size:hover {
	cursor: pointer;
}

.img_btn:hover {
	cursor: pointer;
}

.img_btn {
	width: 20px;
	height: 20px;
	float: right;
	margin: 2px 2%;
}

.side_menu {
	font-weight: 700;
	border: 2px solid;
	border-radius: 20px;
	padding: 0 auto;
	margin: 1% 1%;
}

.side_tedo {
	margin-bottom: .5rem;
	margin: 0 auto;
	padding: 10px;
	overflow: auto;
	margin-left: 1%;
}

.side_menu .span_menu {
	padding: 0 2%;
}

.content {
	color: #eee;
	width: 700px;
	margin: 0 auto;
}

ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.viewport img {
	width: 250px;
	height: 147px;
}

table, tr, td {
	border: 1px solid black;
}

.myOwnTable {
	background-image: url(resources/img/myOwn/도시락4찬.PNG);
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	overflow: hidden;
	display: inline-block;
	width: 500px;
	height: 400px;
}

.rice {
	position: relative;
	top: 70px;
	left: 40px;
	width: 160px;
	height: 260px;
}

.myOwnSpan {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.myOwnSpan>img {
	width: 100%;
	height: 100%;
}

.aBtn:hover {
	cursor: pointer;
}

.main {
	position: relative;
	width: 220px;
	height: 140px;
	top: -70px;
	left: 230px;
}

.sub1 {
	position: relative;
	width: 120px;
	height: 110px;
	top: -330px;
	left: 330px;
}

.sub2 {
	position: relative;
	width: 80px;
	height: 110px;
	top: -440px;
	left: 233px;
}
/* .myOwnTable>div{
	background: #2ecc71;
	border-radius: 15px;
} */
.bottom {
	width: 70%;
	height: 50px;
	margin-left: 15%;
	text-align: center;
}
.buttons input[type=button], .buttons input[type=submit]{
	border-radius: 15px;
	background: #2ecc71;
	border: 1px solid #fff;
	text-transform: uppercase;
	font-weight: bold;
	color: #fff;
}

.buttons input[type=button]:hover, .buttons input[type=submit]:hover {
	color: #2ecc71;
	background: #fff;
	border: 1px solid #2ecc71;
	transition-duration: 1s;
	transform-origin: top left;
	-webkit-transition: all 1s;
	-moz-transition: all 1s;
	-o-transition: all 1s;
	transition: all 1s;
}
#save:hover{
	cursor: pointer;
}
.tooltip_templates { display: none; }
.titleArea{
	margin-top: 1%;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Single+Day&display=swap"rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<!-- jsp:include를 사용하면 Context root가 자동으로 포함된다. -->
	<c:import url="../header/header.jsp" />

	<div style="width: 100%; height: 1000px;">
		<form id="formChange" action="myOwnRecipeUpdate.do" method="post">
		<input type="hidden" id="mblId" name="mblId" value="${mblR.mblId }"/>
		<div style="width: 100%; height: 100%; max-width: 1500px; min-width: 1500px; margin: 0 auto;">
			<div style="text-align: center;">
				<h1 style="font-family: 'Single Day', cursive;">나만의 도시락 수정</h1>
				<img src="resources/img/myOwn/4찬예시및설명.png" style="width: 70%; border-radius: 15px;">
				<div class="input-group mb-3 titleArea" style="width: 40%; margin-left: auto; margin-right: auto;">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1" style="color:#fff; background: #2ecc71">제목 : </span>
					</div>
					<input type="text" id="racipeName" name="racipeName" value="${mblR.mblTitle }" class="form-control" placeholder="나만의 도시락의 제목을 적어주세요." aria-label="Username" aria-describedby="basic-addon1" style="background-color:white;">
				</div>
			</div>
			<div style="width: 70%; height: auto; margin-left: 15%; border: 2px solid black; border-radius: 15px;">
				<div style="width: 100%; height: 400px; text-align: center;">
					<input type="hidden" name="pastFileName" value="${fileName }"/>
					<div class="myOwnTable">
						<div class="rice">
							<span id="rice" class="myOwnSpan" ondrop="drop(event)" ondragover="allowDrop(event)">
								<img id='${rice.inNo }' class='selected' src='resources/img/myOwn/4찬/1_밥/${rice.inRenameFile }'/>
								<input type='hidden' name='selectedRice' value='${rice.inNo }'/>
							</span>
						</div>
						<div class="main">
							<span id="main" class="myOwnSpan" ondrop="drop(event)" ondragover="allowDrop(event)">
								<img id='${main.inNo }' class='selected' src='resources/img/myOwn/4찬/4_메인/${main.inRenameFile }'/>
								<input type='hidden' name='selectedMain' value='${main.inNo }'/>
							</span>
						</div>
						<div class="sub1">
							<span id="sub1" class="myOwnSpan" ondrop="drop(event)" ondragover="allowDrop(event)">
								<img id='${sub1.inNo }' class='selected' src='resources/img/myOwn/4찬/2_서브1/${sub1.inRenameFile }'/>
								<input type='hidden' name='selectedSub1' value='${sub1.inNo }'/>
							</span>
						</div>
						<div class="sub2">
							<span id="sub2" class="myOwnSpan" ondrop="drop(event)" ondragover="allowDrop(event)">
								<img id='${sub2.inNo }' class='selected' src='resources/img/myOwn/4찬/3_서브2/${sub2.inRenameFile }'/>
								<input type='hidden' name='selectedSub2' value='${sub2.inNo }'/>
							</span>
						</div>
					</div>
				</div>
				<!-- 이미지 캡쳐한것을 임시로 저장할 부분 -->
				<div class="buttons" style="text-align:center;">
					<input type="hidden" class="imgSrc" name="imgSrc" id="imgSrc"/>
				</div>
			</div>
			<div class="acodian_menu_list"
				style="width: 70%; height: auto; margin-left: 15%;">
				<dl>
					<dt class="side_menu">
						<span class="span_menu">밥 종류</span> <img class="img_btn"
							src="resources/img/myOwn/plus.jpg" />
					</dt>
					<dd class="side_tedo">
						<div class="viewport">
							<ul class="rices_ul">
								<c:forEach var="rice" items="${riceList }" varStatus="i">
									<li class="rices_li" data-toggle="tooltip" data-placement="bottom" title="이름 : ${rice.inName }, 중량(g) : ${rice.inGram}"><img id="rice${i.count}" name="${rice.inNo }" class="rices" draggable="true" ondragstart="drag(event)" src="resources/img/myOwn/4찬/1_밥/${rice.inRenameFile}"/></li>
								</c:forEach>
							</ul>
						</div>
						<br clear="all">
						<div class="riceButtons" style="text-align: center;"></div>
					</dd>

					<dt class="side_menu">
						<span class="span_menu">메인 반찬</span><img class="img_btn"
							src="resources/img/myOwn/plus.jpg" />
					</dt>
					<dd class="side_tedo">
						<div class="viewport">
							<ul class="main_ul">
								<c:forEach var="main" items="${mainList }" varStatus="i">
									<li class="mains_li" data-toggle="tooltip" data-placement="bottom" title="이름 : ${main.inName }, 중량(g) : ${main.inGram}"><img id="main${i.count}" name="${main.inNo }" class="mains" draggable="true" ondragstart="drag(event)" src="resources/img/myOwn/4찬/4_메인/${main.inRenameFile}"/></li>
								</c:forEach>
							</ul>
						</div>
						<br clear="all">
						<div class="mainButtons" style="text-align: center;"></div>
					</dd>

					<dt class="side_menu">
						<span class="span_menu">서브 반찬1</span><img class="img_btn"
							src="resources/img/myOwn/plus.jpg" />
					</dt>
					<dd class="side_tedo">
						<div class="viewport">
							<ul class="sub1_ul">
								<c:forEach var="sub1" items="${sub1List }" varStatus="i"> 
									<li class="sub1s_li" data-toggle="tooltip" data-placement="bottom" title="이름 : ${sub1.inName }, 중량(g) : ${sub1.inGram}"><img id="sub1${i.count}" name="${sub1.inNo }" class="sub1s" draggable="true" ondragstart="drag(event)" src="resources/img/myOwn/4찬/2_서브1/${sub1.inRenameFile}"/></li>
								</c:forEach>
							</ul>
						</div>
						<br clear="all">
						<div class="sub1Buttons" style="text-align: center;"></div>
					</dd>

					<dt class="side_menu">
						<span class="span_menu">서브 반찬2</span><img class="img_btn"
							src="resources/img/myOwn/plus.jpg" />
					</dt>
					<dd class="side_tedo">
						<div class="viewport">
							<ul class="sub2_ul">
								<c:forEach var="sub2" items="${sub2List }" varStatus="i">
									<li class="sub2s_li" data-toggle="tooltip" data-placement="bottom" title="이름 : ${sub2.inName }, 중량(g) : ${sub2.inGram}"><img id="sub2${i.count}" name="${sub2.inNo }" class="sub2s" draggable="true" ondragstart="drag(event)" src="resources/img/myOwn/4찬/3_서브2/${sub2.inRenameFile}"/></li>
								</c:forEach>
							</ul>
						</div>
						<br clear="all">
						<div class="sub2Buttons" style="text-align: center;"></div>
					</dd>
				</dl>
			</div>
			<div class="bottom">
				<!-- <div class="payment">
					<span>가격 : 4000원</span>
				</div> -->
				<div class="buttons">
					<input class="myOwnUpdateBtn" type="submit" onclick="return validate();" value="수정하기" style="width: 100px; height: 50px;" />
					<input class="myOwnBackBtn" type="button" value="뒤로가기" style="width: 200px; height: 50px;" />
					<input class="createImg" type="hidden">
				</div>
<!-- 				<br>
				<div align="center">(주)옥동도시락</div> -->
			</div>
		</div>
		</form>
		<br clear="all">
	</div>
	

	<script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>
		$(function () {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	<script>
		
		$(function(){
			$("dd:not()").css("display","none");
			$("dl dt").click(function(){
				if($("+dd",this).css("display")=="none"){
					$("dd").slideUp("slow");
					$("+dd",this).slideDown("slow");
				}else{
					$("+dd",this).slideUp("slow");
				}
			});
		});
		
		$(function(){
			var riceLength = $(".viewport .rices_li").length;
			var height = 147;
			var width = 250;
			
			$(".viewport img").css({width:width, height:height});
			$(".viewport").css({width:width*4, height:height, overflow:"hidden"});
			$(".viewport .rices_ul").css({width:width * riceLength});
			$(".viewport li").css({width:width, height:height, float:"left"});
			
			var m = riceLength%4>0?1:0;
			console.log("나머지 값은 : " + m);
			var riceHelf = parseInt(riceLength/4 + "") + m;
			for(let i=0; i<riceHelf; i++){(function(i){
					$("<a class='aBtn'>" + (i + 1) + "<a>").click(function(){
						i = i || 0;
						i = i % riceLength;
						$(".rices_ul").animate({ marginLeft: - width * i * 4 });
					}).appendTo(".riceButtons");
					var nbsp = "&nbsp;&nbsp;";
					$(".riceButtons").append(nbsp);
				})(i);
			}
		});
		
		$(function(){
			var mainLength = $(".viewport .mains_li").length;
			var height = 147;
			var width = 250;
			
			$(".viewport img").css({width:width, height:height});
			$(".viewport").css({width:width*4, height:height, overflow:"hidden"});
			$(".viewport .soups_ul").css({width:width * mainLength});
			$(".viewport li").css({width:width, height:height, float:"left"});
			
			var m = mainLength%4>0?1:0;
			console.log("나머지 값은 : " + m);
			var mainHelf = parseInt(mainLength/4 + "") + m;
			for(let i=0; i<mainHelf; i++){(function(i){
					$("<a class='aBtn'>" + (i + 1) + "<a>").click(function(){
						i = i || 0;
						i = i % mainLength;
						$(".main_ul").animate({ marginLeft: - width * i * 4 });
					}).appendTo(".mainButtons");
					var nbsp = "&nbsp;&nbsp;";
					$(".mainButtons").append(nbsp);
				})(i);
			}
		});
		
		$(function(){
			var sub1Length = $(".viewport .sub1s_li").length;
			var height = 147;
			var width = 250;
			
			$(".viewport img").css({width:width, height:height});
			$(".viewport").css({width:width*4, height:height, overflow:"hidden"});
			$(".viewport .sub1s_ul").css({width:width * sub1Length});
			$(".viewport li").css({width:width, height:height, float:"left"});
			
			var m = sub1Length%4>0?1:0;
			console.log("나머지 값은 : " + m);
			var sub1Helf = parseInt(sub1Length/4 + "") + m;
			for(let i=0; i<sub1Helf; i++){(function(i){
					$("<a class='aBtn'>" + (i + 1) + "<a>").click(function(){
						i = i || 0;
						i = i % sub1Length;
						$(".sub1_ul").animate({ marginLeft: - width * i * 4 });
					}).appendTo(".sub1Buttons");
					var nbsp = "&nbsp;&nbsp;";
					$(".sub1Buttons").append(nbsp);
				})(i);
			}
		});
		
		$(function(){
			var sub2Length = $(".viewport .sub2s_li").length;
			var height = 147;
			var width = 250;
			
			$(".viewport img").css({width:width, height:height});
			$(".viewport").css({width:width*4, height:height, overflow:"hidden"});
			$(".viewport .sub2s_ul").css({width:width * sub2Length});
			$(".viewport li").css({width:width, height:height,float:"left"});
			
			var m = sub2Length%4>0?1:0;
			console.log("나머지 값은 : " + m);
			var sub2Helf = parseInt(sub2Length/4 + "") + m;
			for(let i=0; i<sub2Helf; i++){(function(i){
					$("<a class='aBtn'>" + (i + 1) + "<a>").click(function(){
						i = i || 0;
						i = i % sub2Length;
						$(".sub2_ul").animate({ marginLeft: - width * i * 4 });
					}).appendTo(".sub2Buttons");
					var nbsp = "&nbsp;&nbsp;";
					$(".sub2Buttons").append(nbsp);
				})(i);
			}
		});
		
		function allowDrop(ev) {
		    ev.preventDefault();
		}
		 
		function drag(ev) {
		    ev.dataTransfer.setData("text", ev.target.id);
		}
		 
		function drop(ev) {
			ev.preventDefault();
			
			name = $(ev.target).prop('tagName');
			
			if(name=='SPAN'){
				console.log("span임");
			    var data = ev.dataTransfer.getData("text");
			    var img = document.getElementById(data);
			    console.log(img.id);
			    if(img.id.includes('rice') && ev.target.id == 'rice'){
			    	console.log("밥 확인");
			    	ev.target.innerHTML = "<img id=\'"+img.id+"\' class='selected' src=\'" + img.src + "\'/>";
			    	ev.target.innerHTML += "<input type='hidden' name='selectedRice' value='" + img.name + "'/>";
			    }
			    if(img.id.includes('main') && ev.target.id == 'main'){
			    	console.log("메인 확인");
			    	ev.target.innerHTML = "<img id=\'"+img.id+"\' class='selected' src=\'" + img.src + "\'/>";
			    	ev.target.innerHTML += "<input type='hidden' name='selectedMain' value='" + img.name + "'/>";
			    }
			    if(img.id.includes('sub1') && ev.target.id == 'sub1'){
			    	console.log("반찬1 확인");
			    	ev.target.innerHTML = "<img id=\'"+img.id+"\' class='selected' src=\'" + img.src + "\'/>";
			    	ev.target.innerHTML += "<input type='hidden' name='selectedSub1' value='" + img.name + "'/>";
			    }
			    if(img.id.includes('sub2') && ev.target.id == 'sub2'){
			    	console.log("반찬1 확인");
			    	ev.target.innerHTML = "<img id=\'"+img.id+"\' class='selected' src=\'" + img.src + "\'/>";
			    	ev.target.innerHTML += "<input type='hidden' name='selectedSub2' value='" + img.name + "'/>";
			    }
			    
			    
			}else{
				console.log("span이 아님");
				var spanId = $(ev.target).closest("span")[0].id;
				var data = ev.dataTransfer.getData("text");
				var img = document.getElementById(data);
				
				if(img.id.includes('rice') && spanId == 'rice'){
			    	console.log("밥 확인");
			    	$("#" + spanId).empty();
			    	$("#" + spanId).html("<img class='selected' id=\'"+img.id+"\' src=\'" + img.src + "\'/> <input type='hidden' name='selectedRice' value='" + img.name + "'/>");
			    }
			    if(img.id.includes('main') && spanId == 'main'){
			    	console.log("메인 확인");
			    	$("#" + spanId).empty();
			    	$("#" + spanId).html("<img class='selected' id=\'"+img.id+"\' src=\'" + img.src + "\'/> <input type='hidden' name='selectedMain' value='" + img.name + "'/>");
			    }
			    if(img.id.includes('sub1') && spanId == 'sub1'){
			    	console.log("반찬1 확인");
			    	$("#" + spanId).empty();
			    	$("#" + spanId).html("<img class='selected' id=\'"+img.id+"\' src=\'" + img.src + "\'/> <input type='hidden' name='selectedSub1' value='" + img.name + "'/>");
			    }
			    if(img.id.includes('sub2') && spanId == 'sub2'){
			    	console.log("반찬1 확인");
			    	$("#" + spanId).empty();
			    	$("#" + spanId).html("<img class='selected' id=\'"+img.id+"\' src=\'" + img.src + "\'/> <input type='hidden' name='selectedSub2' value='" + img.name + "'/>");
			    }
			}
		}
		
		// insert하는 부분가기전에 선택된 메뉴들의 개수를 새서 부족하면 메시지 띄우기
		function validate(){
			var selectedCnt = $('.selected').length;
			
			if(selectedCnt > 3){
				if($("#imgSrc").val() == null || $("#imgSrc").val() == ""){
					console.log("비어있음");
					$(".createImg").click();
				}else{
					if(confirm("나만의 도시락을 수정하겠습니까?")){
						console.log("안비어있음");
						return true;
					}else{
						return false;
					}
				}
			}else{
				alert("도시락에 선택되지 않은 항목이 있습니다. 확인해 주세요.");
				return false;
			}
			return false;
		}
		
	</script>
	<script type="text/javascript">
		$(function(){
		   $(".createImg").click(function(){
			   html2canvas($(".myOwnTable"), {
					onrendered: function(canvas) {
						$("#imgSrc").val(canvas.toDataURL("image/png"));
						console.log("이미지 생성됨");
						console.log($(".imgSrc").val());
						
						$(".myOwnUpdateBtn").click();
					}
				});
		   });
		   $(".myOwnBackBtn").click(function(){
			  history.back(); 
		   });
		});
	</script>
</body>
</html>