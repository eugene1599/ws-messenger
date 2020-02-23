import consumer from "./consumer"

function subscribeToWebNotifications(receivedCallback) { 
  return consumer.subscriptions.create({ channel: "WebNotificationsChannel"}, {
    received(data) {
      receivedCallback(data);
    }
  });
}

export { subscribeToWebNotifications };
