import consumer from "./consumer";

const initEventRegistrationCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        const id = messagesContainer.dataset.chatroomId;

        consumer.subscriptions.create({ channel: "EventRegistrationChannel", id: id }, {
            received(data) {
                messagesContainer.insertAdjacentHTML('beforeend', data);
            },
        });
    }
}

export { initEventRegistrationCable };
