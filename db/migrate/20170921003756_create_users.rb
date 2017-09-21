class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :correo
      t.string :campo
      t.string :zona

      t.timestamps null: false
    end
  end
end
