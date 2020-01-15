class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :description
      t.string :user_id
      t.string :thumbnail
      t.string :voice

      t.timestamps
    end
  end
end
