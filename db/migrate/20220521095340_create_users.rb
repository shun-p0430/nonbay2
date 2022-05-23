class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,        null: false
      t.string :password,     null: false
      t.string :nickname,     null: false
      t.integer :aroma,       null: false
      t.integer :impression,  null: false
      t.integer :taste,       null: false
      t.integer :afterglow,   null: false
      t.timestamps
    end
  end
end
