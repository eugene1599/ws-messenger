class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message, null: false
      t.references :chat_room, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
