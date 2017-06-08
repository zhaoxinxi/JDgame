class Post < ApplicationRecord
  belongs_to :product_list
  belongs_to :product
  belongs_to :user
end
