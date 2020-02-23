# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :read, ChatRoom, ChatRoom._public do |chat_room|
      chat_room._public? || chat_room.user_id == user.id || chat_room.members.exists?(user.id)
    end

    can %i[create update], ChatRoom, user_id: user.id
    can :manage, RoomMember, chat_room: { user_id: user.id }
    can :create, Message, user_id: user.id
    can :invite, ChatRoom do |chat_room|
      chat_room.user_id = user.id
    end
  end
end
