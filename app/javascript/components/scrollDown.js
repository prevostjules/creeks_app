// const formFullscreen = document.querySelectorAll("#message_content");
// const messages = document.querySelectorAll("#messages");
// if (formFullscreen) {
//   formFullscreen.forEach((form) => {
//     addEventListener('keypress', (e) => {
//       if(e.key === 'Enter') {
//         scrollDown()
//       }
//     } );
//   })
// }

const scrollDown = (element) => {
  element.scrollIntoView();
};

export { scrollDown };
