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




/*function delect(listId){
	if(confirm("정말 삭제 하시겠습니까?")){
		$.ajax({
			url : ,
			data : {},
			type : ,
			success : function(data){
				
				$("."+listId).remove();
			}, error : function(data){
				
			}
		});
	}
	
	
}*/


// 판매상태 설정 설정
// 판매 상태가 변경이 되면


// selected 값 변경 됏을때
function change(result){
	console.log(result);
	var num = result; // 구분 번호를 넣어준다.
	
	//var selected = $(this).children('option');
	var selected = $('#select'+num).val();
	console.log(selected);
    //$(this).closest('td').prev().children('.result').text(selected);
	$('#result'+num).text(selected );
}


function deleted(listId){
	
	console.log(listId);
	/*if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url : ,
			data : ,
			type : ,
			success: function(data){
				$(listId).remove();
			}
			
		});
		
	}*/
}


// 처음 들어 갈때 상품 상태 가져오기
$(function(){
	$('')
});





