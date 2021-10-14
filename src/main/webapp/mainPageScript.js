function makeCursor() {
	document.onmousemove = function(e) {
		let foot = document.getElementById("foot");
		foot.style.left = event.clientX + 15 + "px";
		foot.style.top = event.clientY + 15 + "px";
	}
}
