class CreatePrefecttures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefecttures do |t|

      t.string :name

      t.timestamps
    end
  end
end
