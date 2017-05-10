class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :user_id, null: false

      t.timestamps null:false
    end
  end
end