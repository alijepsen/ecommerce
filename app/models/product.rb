class Product < ApplicationRecord
  has_many :comments
  belongs_to :category
  belongs_to :cart
end
