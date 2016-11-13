class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category

  has_attached_file :avatar, styles: {
    large: "500x500>", medium: "400x400>", small: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
