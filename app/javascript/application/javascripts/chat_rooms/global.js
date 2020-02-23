import { subscribeToWebNotifications } from '../../../channels/web_notification_channel'
import toastr from 'toastr';


function receiveNotificationCallback(data) {
  toastr.info(data.body, data.title, { timeOut: 0, closeButton: true, extendedTimeOut: 0 });
}

$(document).ready(function() {
  subscribeToWebNotifications(receiveNotificationCallback);
});
