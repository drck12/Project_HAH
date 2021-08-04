var mql = window.matchMedia("screen and (max-width: 1024px)");

mql.addListener(function(e) {
    if(e.matches) {
    	document.getElementById('wrap').classList.add("mobile");
    	document.getElementById('wrap').classList.remove("pc");
    } else {
    	document.getElementById('wrap').classList.add("pc");
    	document.getElementById('wrap').classList.remove("mobile");
    }
});
