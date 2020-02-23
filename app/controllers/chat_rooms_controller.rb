class ChatRoomsController < ApplicationController
  load_and_authorize_resource except: [:private]

  def index
    @chat_rooms = @chat_rooms.order(created_at: :desc)
  end

  def new; end

  def create
    @chat_room = Messenger::SaveChatRoomService.new(@chat_room).call
    return render :new unless @chat_room.persisted?

    redirect_to chat_room_path(@chat_room)
  end
  
  def show
    @message = Message.new
  end

  def private
    @chat_rooms = current_user.all_private_rooms
    @is_private = true
    
    render 'chat_rooms/index'
  end

  def invite
    @invited_user = Messenger::InviteUserToPrivateChatService.new(@chat_room, invite_params).call
    respond_to :js
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name, :description, :room_type)
  end

  def invite_params
    params.require(:invite).permit(:email)
  end
end
