$(function(){
		$(document).on('click', '#b', function(){
			
			var board_no = $(this).siblings('input[name=board_no]').val()
			var review_content = $(this).siblings('input[name=review_content]').val()
			alert(review_content)
			
			$(this).parent().siblings(`#c${board_no }`).html(`<input type="text" name="review_content" value="${review_content }">`
					)
					$(this).text('저장')
					$(this).attr('onclick', `d(${board_no})`)
			
		});
	})

	function d(board_no){
		var update_review_content = document.getElementsByName("review_content")[0].value;
		alert(update_review_content);
		
		if(update_review_content != null){
			$.ajax({
				url:"AnswerUpdate",
				type:"post",
				data:"board_no="+board_no+"&review_content="+update_review_content,
				success:function(msg){
					alert(msg.updatechk + '내 이름은 강선웅 거꾸로 하면 웅선강');
					$(`#review_content${board_no}`).text('덧글내용 : ' + msg.content);
					$(`#review_content${board_no}`).siblings('#a').children('#b').text('수정')
				}, error:function(){
					alert("통신실패");
				}
			});
		}
	}