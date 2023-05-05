class Property < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  enum property_type: { arriendo: 0, compra: 1 }
  validates :property_type, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :comuna, presence: true
  validates :area, presence: true, numericality: { greater_than: 0 }
  validates :rooms, presence: true, numericality: { greater_than: 0 }
  validates :bathrooms, presence: true, numericality: { greater_than: 0 }
  has_many_attached :photos
  validates :photos, presence: true
end
