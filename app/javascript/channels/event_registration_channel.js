import consumer from "./consumer";

const initEventRegistrationCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        const id = messagesContainer.dataset.chatroomId;

        consumer.subscriptions.create({ channel: "EventRegistrationChannel", id: id }, {
            received(data) {
              const currentUserId = messagesContainer.dataset.currentuser;
              const senderId = data.match(/sender-\d+/)[0].replace(/sender-/, '');
              const textInput = document.querySelector('.new_message');

              if (currentUserId != senderId) {
                data = data.replace('message-owner', 'message-mate')
              }
              
              textInput.reset();
              messagesContainer.insertAdjacentHTML('beforeend', data);
              messagesContainer.scrollTop = messagesContainer.scrollHeight;
            },
        });
    }
}

export { initEventRegistrationCable };
