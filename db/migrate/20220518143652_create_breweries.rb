class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name,     null: false
      t.references :area, null: false, foreign_key: true
      t.timestamps
    end
  end
end
