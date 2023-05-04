class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :type
      t.integer :price
      t.string :comuna
      t.integer :area
      t.integer :rooms
      t.integer :bathrooms

      t.timestamps
    end
  end
end
