class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :price_level
      t.references :category, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.string :adress
      t.float :latitude
      t.float :longitude
      t.integer :rating

      t.timestamps
    end
  end
end
