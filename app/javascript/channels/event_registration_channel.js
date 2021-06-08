import consumer from "./consumer";

const initEventRegistrationCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        const id = messagesContainer.dataset.chatroomId;

        consumer.subscriptions.create({ channel: "EventRegistrationChannel", id: id }, {
            received(data) {
              const currentUserId = messagesContainer.dataset.currentuser;
              const senderId = data.match(/sender-\d+/)[0].replace(/sender-/, '');
              if (currentUserId != senderId) {
                data = data.replace('message-owner', 'message-mate')
              }
              messagesContainer.insertAdjacentHTML('beforeend', data);
            },
        });
    }
}

export { initEventRegistrationCable };
