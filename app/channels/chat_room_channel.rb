class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find(params[:id])
    return unless ability.can? :read, chat_room

    stream_for chat_room
  end
end
