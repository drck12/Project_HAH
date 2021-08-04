

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
//화면크기가 변경될 때마다 showGradient를 호출하여 현재 스크롤에 따라 헤더 색상 변경
$(window).resize(function(){
    	showGradient();
});
//스크롤에 따라 헤더 색상 변경
function showGradient(){
    if($(this).scrollTop() != 0){
    	$(".header").css("background-color","white");
    	$(".header_div").css("background-color","white");
    	$(".grp_dropbtn").css("background-color","white");
    	$(".nontop_color").css("color","black");
    	$(".nontop_myplace").css("color","black");
    	$(".nontop_login").css("color","black");
    	$(".logout_dropbtn").css("background-color","#fff");
    	document.getElementById("main_logo").src = "http://localhost:8500/hah/resources/img/new_main_logo_mo.png";
    	document.getElementById("search_icon").style.background = "url('http://localhost:8500/hah/resources/img/ico_srch_mo.png') no-repeat";
    	document.getElementById("search_icon").style.backgroundSize = "30px"; 
    	$(".header").css("box-shadow","0px 2px 3px 0px rgb(0 0 0 / 10%)");
    }else{
    	if(!mql.matches){
    	$(".header").css("background-color","rgba(250, 88, 91, 1)");
    	$(".header_div").css("background-color","rgba(250, 88, 91, 1)");
    	$(".grp_dropbtn").css("background-color","rgba(250, 88, 91, 1)");
    	$(".nontop_color").css("color","rgba(255,255,255,0.8)");
    	$(".nontop_myplace").css("color","rgba(255,255,255,0.8)");
    	$(".nontop_login").css("color","rgba(255,255,255,0.8)");
    	$(".logout_dropbtn").css("background-color","rgba(250, 88, 91, 1)");
    	document.getElementById("main_logo").src = "http://localhost:8500/hah/resources/img/new_main_logo_pc.png";
    	document.getElementById("search_icon").style.background = "url('http://localhost:8500/hah/resources/img/ico_srch.png') no-repeat";
    	document.getElementById("search_icon").style.backgroundSize = "30px";
    	$(".header").css("box-shadow","none");
    };
  }}
$(window).scroll(function(event){
	showGradient();
    $('#wrap').on('scroll',showGradient);
	});

















