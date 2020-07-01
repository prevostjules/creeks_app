const formFullscreen = document.querySelectorAll("#message_content");
const messages = document.querySelectorAll("#messages");

const scrollDown = () => {
  if (formFullscreen) {
    formFullscreen.forEach((form) => {
      addEventListener('keypress', function (e) {
       if (e.key === 'Enter') {
         messages[1].scrollTo(-10, messages[1].scrollHeight)
       }
      });
    })
  }
};


export { scrollDown };
