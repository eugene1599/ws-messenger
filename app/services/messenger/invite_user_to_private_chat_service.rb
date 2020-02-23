module Messenger
  class InviteUserToPrivateChatService
    def initialize(chat_room, params)
      @chat_room = chat_room
      @params = params
    end

    def call
      @invited_user = find_user_by_email(params[:email])

      return unless invited_user
      return invited_user if chat_room.members.exists?(invited_user.id)

      add_user_to_chat_room
      notify_invited_user
      send_new_channel_to_ws

      invited_user
    end

    private

    attr_reader :chat_room, :params, :invited_user

    def find_user_by_email(email)
      return if email == chat_room.user.email

      User.find_by(email: email)
    end

    def add_user_to_chat_room
      RoomMember.create!(user: invited_user, chat_room: chat_room)
    end

    def notify_invited_user
      WebNotificationsChannel.broadcast_to(
        invited_user, 
        title: I18n.t('notifications.invite.title'), 
        body: I18n.t('notifications.invite.body', user: chat_room.user.email, chat_name: chat_room.name), 
      )
    end

    def send_new_channel_to_ws
      RoomsListChannel.broadcast_to('all_private_rooms', render_message(chat_room))
    end

    def render_message(chat_room)
      MessagesController.render partial: 'chat_rooms/partials/chat_room', locals: { chat_room: chat_room }
    end

  end
end