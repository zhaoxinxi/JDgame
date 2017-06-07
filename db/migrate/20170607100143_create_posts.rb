class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :product_list_id
      t.integer :product_id

      t.timestamps
    end
  end
end
