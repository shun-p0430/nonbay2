class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name,        null: false
      t.references :brewery, null: false, foregin_key: true
      t.timestamps
    end
  end
end
