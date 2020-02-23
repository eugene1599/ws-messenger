import { subscribeToWebNotifications } from '../../../channels/web_notification_channel'
import toastr from 'toastr';


function receiveNotificationCallback(data) {
  toastr.info(data.body, data.title);
}


$(document).ready(function() {
  subscribeToWebNotifications(receiveNotificationCallback);
})