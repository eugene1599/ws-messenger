module Messenger
  class SaveChatRoomService
    def initialize(chat_room)
      @chat_room = chat_room
    end

    def call
      send_new_channel_to_ws if chat_room.save

      chat_room
    end

    private

    attr_reader :chat_room

    def send_new_channel_to_ws
      return if chat_room._private?

      RoomsListChannel.broadcast_to('all_public_rooms', render_message(chat_room))
    end

    def render_message(chat_room)
      MessagesController.render partial: 'chat_rooms/partials/chat_room', locals: { chat_room: chat_room }
    end
  end
end