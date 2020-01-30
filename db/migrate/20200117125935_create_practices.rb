class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :title
      t.text :description
      t.string :video
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
