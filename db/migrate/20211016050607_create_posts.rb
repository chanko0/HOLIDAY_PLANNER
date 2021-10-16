class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :review_id
      t.string :prefecture
      t.string :city
      t.string :image_id
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
