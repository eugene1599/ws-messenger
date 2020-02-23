class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.string :name, null: false
      t.text :description
      t.integer :room_type, default: 0, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
