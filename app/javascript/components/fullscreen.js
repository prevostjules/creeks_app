const elem = document.getElementById("fullscreen");
const btn = document.getElementById("fullscreen-btn");
const iframe = document.getElementById("fullscreen-iframe")

const fullscreen = () => {
  if (elem) {
    btn.addEventListener("click", (event) => {
      elem.requestFullscreen();
    });
  }
}

const normalScreen = () => {
  if (elem && document.fullscreenElement == null) {
    iframe.height = "480px";
  }
}



export { fullscreen, normalScreen }
