class Property < ApplicationRecord
  enum property_type: { arriendo: 0, compra: 1 }

  belongs_to :user
  has_many_attached :photos

  validates :title, :description, :property_type, :price, :area, :comuna, :rooms, :bathrooms, :photos, presence: true
  validates :price, :area, :rooms, :bathrooms, numericality: { greater_than: 0 }
end
