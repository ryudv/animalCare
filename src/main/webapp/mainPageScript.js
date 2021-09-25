function makeCursor() {
	document.onmousemove = function(e) {
		let foot = document.getElementById("foot");
		foot.style.left = event.clientX + 15 + "px"; // 단위 "px"를 꼭 붙여야 함
		foot.style.top = event.clientY + 15 + "px";
	}
}