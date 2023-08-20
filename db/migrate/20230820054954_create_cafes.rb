class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|

      t.integer :prefecture_id
      t.string :cafe_name
      t.string :address

      t.timestamps
    end
  end
end
