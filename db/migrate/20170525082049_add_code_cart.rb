class AddCodeCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts,:code,:string
  end
end
