const elem = document.getElementById("fullscreen");
const btn = document.getElementById("fullscreen-btn");
const iframe = document.getElementById("fullscreen-iframe");
const chat = document.getElementById("chat-fullscreen");
const infoStreamer = document.getElementById("infos-streamer");

// const fullscreen = () => {
//   if (elem) {
//     btn.addEventListener("click", (event) => {
//       elem.requestFullscreen();
//       chat.style.display = "block";
//     });
//     document.onkeydown = function(evt) {
//       evt = evt || window.event;
//       if (evt.keyCode == 27) {
//         chat.style.display = "none";
//       }
//     };
//   }
// }

const fullscreen = () => {
  if (elem) {
    btn.addEventListener("click", (event) => {
      elem.requestFullscreen();
      infoStreamer.style.display = "none";
      chat.style.display = "block";
    });
    document.getElementById("fullscreen").addEventListener('fullscreenchange', (event) => {
      if (document.fullscreenElement == null) {
      chat.style.display = "none";
      }
    });
  }
}



    // window.addEventListener("keydown", (event) => {
    // if (document.fullscreenElement) {
    //   console.log("cocuou");
    //   chat.style.display = "none";
    // }
    // })
// if (document.fullscreenElement) {
//     document.exitFullscreen()
//   } else {
//     document.documentElement.requestFullscreen()
//   }

//   const normalScreen = () => {
//     if (elem && document.fullscreenElement == null) {
//       console.log("cocuou")
//     }
//   }



export { fullscreen }
