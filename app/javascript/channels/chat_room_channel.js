import consumer from "./consumer"

function subscribeToChatRoom(chatRoomId, receivedCallback) { 
  return consumer.subscriptions.create({ channel: "ChatRoomChannel", id: chatRoomId}, {
    received(data) {
      receivedCallback(data);
    }
  });
}

function subscribeToRoomsList(receivedCallback) {
  return consumer.subscriptions.create({ channel: "RoomsListChannel" }, {
    received(data) {
      receivedCallback(data);
    }
  });
}

function subscribeToPrivateRoomsList(receivedCallback) {
  return consumer.subscriptions.create({ channel: "RoomsListChannel", private: true }, {
    received(data) {
      receivedCallback(data);
    }
  });
}

export { subscribeToChatRoom, subscribeToRoomsList, subscribeToPrivateRoomsList };
