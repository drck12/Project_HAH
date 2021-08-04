function openCity(evt, cityName) {
	/* Declare all variables */
	var i, tabcontent, tablinks;

	/* Get all elements with class="tabcontent" and hide them */
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	/* Get all elements with class="tablinks" and remove the class "active" */
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}

	/*
	 * Show the current tab, and add an "active" class to the link that opened
	 * the tab
	 */
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}



var mql = window.matchMedia("screen and (max-width: 1024px)");

mql.addListener(function(e) { //사이즈에맞게 class명 바뀌게
    if(e.matches) {
    	document.getElementById('wrap').classList.add("mobile");
    	document.getElementById('wrap').classList.remove("pc");
    	document.getElementById('srch_lab').classList.remove('srch_extend');
    	document.getElementById('map-modal-bgh').classList.remove('map-modal-bgh');
    } else {
    	document.getElementById('wrap').classList.add("pc");
    	document.getElementById('wrap').classList.remove("mobile");
    	document.getElementById('side-menu').classList.remove('side-menu');
    	document.getElementById('map-modal-bgh').classList.remove('map-modal-bgh');
    	document.getElementById('menuicon').checked = false;
    	document.getElementById('side_top').classList.remove('side_top');
    }
});

function searchbar_on(){ //검색바 늘어나고 줄어들게 / 모달창
	document.getElementById('srch_lab').classList.toggle('srch_extend');
	document.getElementById('map-modal-bgh').classList.toggle('map-modal-bgh');
	document.getElementById('map-modal-containerh').classList.add('map-modal-containerh');
	
	
};

function closemodalh(){ //모달창 닫을때 여백 또는 검색돋보기 눌렀을때  사라지게
	document.getElementById('srch_lab').classList.remove('srch_extend');
	document.getElementById('side-menu').classList.remove('side-menu');
	document.getElementById('map-modal-bgh').classList.remove('map-modal-bgh');
	document.getElementById('menuicon').checked = false;
	document.getElementById('hamber_menu_mo').classList.remove('hamber_modal_on');
	document.getElementById('side_top').classList.remove('side_top');
};

function ham_modal_on(){ //햄버거 늘어나고 줄어들게 / 모달창
	document.getElementById('map-modal-bgh').classList.toggle('map-modal-bgh');
	document.getElementById('hamber_menu_mo').classList.toggle('hamber_modal_on');
	document.getElementById('side-menu').classList.toggle('side-menu');
	document.getElementById('side_top').classList.toggle('side_top');

};


// 스크롤 변경 감지하여 스크롤 내려가면 헤더가 하얗게 변하는 기능
var mql = window.matchMedia("screen and (max-width: 1024px)");
$(window).resize(function(){
if(!mql.matches){
    	$(".header").css("background","none");
    	$(".header_div").css("background","none");
    	$(".grp_dropbtn").css("background","none");
    	$(".nontop_color").css("color","rgba(255,255,255,0.8)");
    	document.getElementById("main_logo").src = "resources/img/new_main_logo_pc.png";
    	document.getElementById("search_icon").style.background = "url('resources/img/ico_srch.png') no-repeat";
    	document.getElementById("search_icon").style.backgroundSize = "30px";	
}});
function showGradient(){
    if($(this).scrollTop() != 0){// 스크롤이 0일 때   
    	$(".header").css("background-color","white");
    	$(".header_div").css("background-color","white");
    	$(".grp_dropbtn").css("background-color","white");
    	$(".nontop_color").css("color","black");
    	document.getElementById("main_logo").src = "resources/img/new_main_logo_mo.png";
    	document.getElementById("search_icon").style.background = "url('resources/img/ico_srch_mo.png') no-repeat";
    	document.getElementById("search_icon").style.backgroundSize = "30px";	
    }else{
    	if(!mql.matches){
    	$(".header").css("background","none");
    	$(".header_div").css("background","none");
    	$(".grp_dropbtn").css("background","none");
    	$(".nontop_color").css("color","rgba(255,255,255,0.8)");
    	document.getElementById("main_logo").src = "resources/img/new_main_logo_pc.png";
    	document.getElementById("search_icon").style.background = "url('resources/img/ico_srch.png') no-repeat";
    	document.getElementById("search_icon").style.backgroundSize = "30px";
    };
  }}
$(window).scroll(function(event){
	showGradient();
    $('#wrap').on('scroll',showGradient);
	});

