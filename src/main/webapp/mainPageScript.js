function makeCursor() {
	document.onmousemove = function(e) {
		let foot = document.getElementById("foot");
		foot.style.left = event.clientX + 15 + "px";
		foot.style.top = event.clientY + 15 + "px";
	}
}

function mainZoomIn(e) {
    event.target.style.width = "195px";
    event.target.style.height = "195px";
    event.target.style.transition = "all 0.3s";
 }

 function mainZoomOut(e) {
    event.target.style.width = "180px";
    event.target.style.height = "180px";
    event.target.style.transition = "all 0.3s";
 }

function zoomIn(e) {
    event.target.style.transform = "scale(1.1)";
    event.target.style.zIndex = 1;
    event.target.style.transition = "all 0.3s";
 }

 function zoomOut(e) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.3s";
 }