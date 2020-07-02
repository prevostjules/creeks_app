import consumer from "./consumer";
import { scrollDown } from "../components/scrollDown"

const initChatroomCable = () => {
  const messagesContainers = Array.from(document.getElementsByClassName('messages-ok'));
  if (messagesContainers.length > 0) {
    const id = messagesContainers[1].dataset.chatroomId;

    consumer.subscriptions.create({ channel: "CreekChannel", id: id }, {
      received(data) {
        messagesContainers.forEach((messagesContainer) => {
          // const doc = new DOMParser().parseFromString(data, "text/xml");
          // const idMessage = doc.all[0].attributes[1].nodeValue;
          messagesContainer.insertAdjacentHTML('beforeend', data);
          // const message = messagesContainer.querySelector(idMessage);
          // console.log(message);
          const author = messagesContainer.querySelectorAll(".author")
          const lastAuthor = author[author.length - 1];
          scrollDown(lastAuthor);
          const form = document.querySelectorAll('.new_message');
          document.querySelectorAll('.new_message').forEach((form) => {
            form.reset();
          })
        });
      },
    });
  }
}

export { initChatroomCable };
