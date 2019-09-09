/*$(function(){
	$(".py").on("click",function(){
		var id = $(this).attr('id');
		
		if(id == 'py'){
			
			location.href="";
		}else if(id == 'deleted'){
			// 삭제 버튼 눌렷을때 작동
			delect();
		}
	});
});*/






// 판매상태 설정 설정
// 판매 상태가 변경이 되면


// selected 값 변경 됏을때 판매상태 설정
function change(p_Id){
	console.log(p_Id);
	var num = p_Id; // 구분 번호를 넣어준다.
	 // 판매중에서 판매 중지로 변경되서 옴
	//var selected = $(this).children('option');
	var selected = $('#select'+num).val();
	console.log(selected);
    //$(this).closest('td').prev().children('.result').text(selected);
	$('#result'+num).text(selected);
	
	$.ajax({
		url : "updatePsell.do",
		data : {p_Id:p_Id, selected:selected},
		type:"post",
		success:function(data){
			alert("상품 판매상태가 변경 되었습니다.");
			
			
			
		},error:function(data){
			alert("수정중 오류 발생");
		}
	});
	
}



/*function deleted(listId){
	
	console.log(listId);
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url : ,
			data : ,
			type : ,
			success: function(data){
				$(listId).remove();
			}
			
		});
		
	}
}*/


// 처음 들어 갈때 상품 상태 가져오기
$(function(){
	$('')
});





