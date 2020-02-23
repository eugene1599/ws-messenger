class CreateRoomMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_members do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :chat_room, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
