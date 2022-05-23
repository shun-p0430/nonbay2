class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :brand,    null: false, foreign_key: true
      t.integer :aroma,       null: false
      t.integer :impression,  null: false
      t.integer :taste,       null: false
      t.integer :afterglow,   null: false
      t.text :comment
      t.timestamps
    end
  end
end
