import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.querySelectorAll('#messages');
  if (messagesContainer) {
    const id = messagesContainer[1].dataset.chatroomId;

    consumer.subscriptions.create({ channel: "CreekChannel", id: id }, {
      received(data) {
        messagesContainer.forEach((messageContainer) => {
          messageContainer.insertAdjacentHTML('beforeend', data);
        });
         // called when data is broadcast in the cable
      },
    });
  }
}

export { initChatroomCable };
