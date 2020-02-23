import { subscribeToChatRoom } from '../../../channels/chat_room_channel'

let chatRoom = $('#chat-room'),
    chatRoomId = chatRoom.data('chatroom-id'),
    messagesContainerSelector = '.messages-container';

function scrollChatToBottom() {
  $(messagesContainerSelector).get(0).scrollTop = $(messagesContainerSelector).get(0).scrollHeight;
}

function removeNoMessagesLabel() {
  $('.no-messages').remove();
}

function receiveMessageCallback(data) {
  $(messagesContainerSelector).append(data);
  scrollChatToBottom();
  removeNoMessagesLabel();
}

if (chatRoom.length) {
  $(document).ready(function() {
    subscribeToChatRoom(chatRoomId, receiveMessageCallback);
    scrollChatToBottom();
  });
}
