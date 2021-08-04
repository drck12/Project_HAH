//리뷰버튼 눌렀을때
function review_board_on(){
	document.getElementById("reserve_price_info").style.display ='none';
	document.getElementById("review_board_form").style.display ='block';
	document.getElementById("review_btn").style.display ='none';
	document.getElementById("review_cancel_btn").style.display ='block';
	document.getElementById("write_from2").style.display ='block';
	document.getElementById("re_reserve").style.display ='none';
	document.getElementById("review_finish_btn").style.display ='block';
	
	

const btnElement = document.getElementById('review_btn');
	  btnElement.innerText = '리뷰 취소';

}

/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/

var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b"),
	$hidden = document.getElementById('hidden_rating');
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){
    	$result.text($(this).next().text());
    	$hidden.value = $result.text();
  	})
    .on("mouseover", ".star-input label", function(){
    	$result.text($(this).text());
    	$hidden.value = $result.text();
    	 
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
     	 		$hidden.value = $result.text();
     	 		
   		 	} else {
     	 		$result.text($checked.next().text());
     	 		$hidden.value = $result.text();
     	 		
    		}
  	});
};


$(function() { 
starRating()
});