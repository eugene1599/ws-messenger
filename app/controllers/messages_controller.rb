class MessagesController < ApplicationController
  load_and_authorize_resource :chat_room
  load_and_authorize_resource :message, through: :chat_room

  def index; end

  def create
    @message = Messenger::SaveMessageService.new(@message).call
    @message = Message.new if @message.persisted?

    respond_to :js
  end

  private

  def message_params
    params.require(:message).permit(:chat_room_id, :message)
  end
end
