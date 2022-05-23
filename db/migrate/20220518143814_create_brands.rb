class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name,        null: false
      t.references :brewery, null: false, foregin_key: true
      t.decimal :aroma, precision: 3, scale: 2
      t.decimal :impression, precision: 3, scale: 2
      t.decimal :taste, precision: 3, scale: 2
      t.decimal :afterglow, precision: 3, scale: 2
      t.timestamps
    end
  end
end
