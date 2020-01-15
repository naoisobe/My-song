class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.text :description
      t.string :user_id
      t.string :thumbnail
      t.string :voice null: false

      t.timestamps
    end
  end
end
