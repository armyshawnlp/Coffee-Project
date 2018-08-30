class Product < ApplicationRecord

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items


  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
