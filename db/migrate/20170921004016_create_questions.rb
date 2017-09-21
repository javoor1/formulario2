class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :no_value
      t.integer :yes_value
      t.belongs_to :block, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
