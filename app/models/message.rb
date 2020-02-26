class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def sent_at
    created_at.strftime('%FT%T')
  end
end
