window.onload = function() {
	loadPage("/pages/test.html");
	replaceAnchors();
}

function replaceAnchors() {
	var anchors = document.getElementsByTagName("a");
	for(var i in anchors) {
		var anchor = anchors[i];
		console.log(anchor);
		anchor.onclick = function() {
			loadPage(anchor.href);
		}
		console.log(anchor);
	}
}

function loadPage(pageName) {
	var req = new XMLHttpRequest();
	req.addEventListener('load', function () {
		var textbody = document.getElementById("text-body");
		textbody.innerHTML = this.responseText;
	});
	req.open("GET", pageName);
	req.send(null);
}
