class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :treshold1
      t.integer :treshold2

      t.timestamps null: false
    end
  end
end
