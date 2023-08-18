class CreateCafePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_posts do |t|

      t.integer :cafe_id
      t.integer :user_id
      t.text :cafe_comment

      t.timestamps
    end
  end
end
