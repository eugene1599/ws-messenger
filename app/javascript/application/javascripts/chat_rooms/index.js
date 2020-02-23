import { subscribeToRoomsList } from '../../../channels/chat_room_channel'

let container = $('.chat-rooms-container:not(.private-rooms)'),
    noRoomsLabelSelector = '.no-rooms-label';

function removeNoRoomsLabel() {
  $(noRoomsLabelSelector).remove();
}

function receivedCallback(data) {
  $(data).prependTo(container).hide().slideDown();
  removeNoRoomsLabel();
}

if (container.length) {
  $(document).ready(function() {
    subscribeToRoomsList(receivedCallback);
  });
}
