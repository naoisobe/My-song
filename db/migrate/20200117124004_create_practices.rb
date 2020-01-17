class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :title
      t.text :description
      t.integer :voice
      t.string :user_id
      t.string :instructor_id

      t.timestamps
    end
  end
end
