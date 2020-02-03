class CreateAdviseChats < ActiveRecord::Migration[5.2]
  def change
    create_table :advise_chats do |t|
      t.string :message
      t.references :instructor, foreign_key: true
      t.references :user, foreign_key: true
      t.references :practice, foreign_key: true

      t.timestamps
    end
  end
end
