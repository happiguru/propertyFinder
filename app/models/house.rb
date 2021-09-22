class House < ApplicationRecord
  validates :house_name, :city, :address, :description_short, :price, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
end
