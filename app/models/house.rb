class House < ApplicationRecord
  validates :house_name, :city, :address, :description_short, :price, presence: true
end
