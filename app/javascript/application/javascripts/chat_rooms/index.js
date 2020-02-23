import { subscribeToRoomsList } from '../../../channels/chat_room_channel'

let container = $('.chat-rooms-container:not(.private-rooms)');

function removeNoMessagesLabel() {
  $('.no-rooms-label').remove();
}

function receivedCallback(data) {
  $(data).prependTo(container).hide().slideDown();
  removeNoMessagesLabel();
}

if (container.length) {
  $(document).ready(function() {
    subscribeToRoomsList(receivedCallback);
  });
}