/*--------------photo start----------------*/

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}

/*--------------photo end----------------*/

/*--------------tab content start----------------*/
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

/*--------------tab content end----------------*/

/*----------accordion content start--------------------*/
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active1");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = "1000px";
    } 
  });
}

document.getElementById("defaultOpen1").click();
/*----------accordion content end--------------------*/

/*----------review pagination start--------------------*/

$(function () {
    let container = $('#pagination');
    container.pagination({
        dataSource: total,
        pageSize: 5,
        callback: function (data, pagination) {
            var dataHtml = "";
            
            $.each(data, function (index, item) {
                dataHtml += document.getElementById(item).innerHTML;
            });
            
            $("#data-container").html(dataHtml);
        }
    })
})

/*----------review pagination end--------------------*/

/*----------air datepicker start--------------------*/
;(function ($) { $.fn.datepicker.language['en'] = {
    days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
    daysShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    daysMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
    months: ['January','February','March','April','May','June', 'July','August','September','October','November','December'],
    monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    today: 'Today',
    clear: 'Clear',
    dateFormat: 'yyyy-mm-dd',
    timeFormat: 'hh:ii aa',
    firstDay: 0
}; })(jQuery);



$('.datepicker-here').datepicker({
	clearButton: true,
    autoClose: true,
    todayButton: new Date(),
    minDate: new Date(),
    onShow: function(dp, animationCompleted){
        current_date = $('.datepicker-here').val();
    },
    onHide: function(dp, animationCompleted){
    	var date = $('.datepicker-here').val();
        if(date.length > 15){
        	if(date == current_date){
        		document.getElementById("datepicker").value = current_date;
        	}else{
        		location.href="kdetail_page?date=" + date +"&acc_code=" + acc_code;
        	}
        }else{
            alert("올바른 날짜를 입력해 주세요.");
            document.getElementById("datepicker").value = current_date;
        }
    }
});

$(function() {
	document.getElementById("datepicker").value = current_date;
});
var1 = "rebre_write_text";
var2 = "rebre_write_btn";
/*window.addEventListener('DOMContentLoaded', function rebre_write_on(reb_seq){
	alert(reb_seq);
	document.getElementById("rebre_write_text"+reb_seq).style.display ='block';
	document.getElementById("rebre_write_btn8"+reb_seq).style.display ='block';
});
*/

/*----------air datepicker end--------------------*/