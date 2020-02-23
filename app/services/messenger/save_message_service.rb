module Messenger
  class SaveMessageService
    def initialize(message)
      @message = message
    end

    def call
      send_message_to_ws_channel if message.save

      message
    end

    private

    attr_reader :message

    def send_message_to_ws_channel
      ChatRoomChannel.broadcast_to(message.chat_room, render_message(message))
    end

    def render_message(message)
      MessagesController.render partial: 'messages/partials/message', locals: { message: message }
    end
  end
end
