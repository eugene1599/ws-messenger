class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  
  has_many :room_members, dependent: :destroy
  has_many :members, source: :user, through: :room_members

  enum room_type: { _public: 0, _private: 1 }

  validates :name, uniqueness: true, presence: true
end
