import consumer from "./consumer";
import { scrollDown } from "../components/scrollDown"

const initChatroomCable = () => {
  const messagesContainers = Array.from(document.getElementsByClassName('messages-ok'));
  if (messagesContainers.length > 0) {
    const id = messagesContainers[1].dataset.chatroomId;

    consumer.subscriptions.create({ channel: "CreekChannel", id: id }, {
      received(data) {
        messagesContainers.forEach((messagesContainer) => {
          const doc = new DOMParser().parseFromString(data, "text/xml");
          const idUser = doc.all[0].attributes[2].value;
          const idCurrentUser = document.getElementById("user-id").dataset.userId;
          if (idUser == idCurrentUser) {
            doc.all[0].classList.add("text-right");
            data = new XMLSerializer().serializeToString(doc.documentElement);
          }
          messagesContainer.insertAdjacentHTML('beforeend', data);
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
