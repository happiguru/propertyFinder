class House < ApplicationRecord
include Rails.application.routes.url_helpers
  validates :house_name, :city, :address, :description_short, :price, presence: true
  
  has_one_attached :image
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy

  def image_url
    url_for(image)
  end
end
