class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :property_type
      t.integer :price
      t.string :comuna
      t.integer :area
      t.integer :rooms
      t.integer :bathrooms
      t.string :title
      t.string :description
      t.references :users, foreign_key: true, index: true


      t.timestamps
    end
  end
end
