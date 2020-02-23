class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy

  has_many :room_members, dependent: :destroy
  has_many :private_rooms, source: :chat_room, through: :room_members

  def username
    email.split('@').first
  end

  def all_private_rooms
    (private_rooms + chat_rooms._private).uniq
  end
end
