class House < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :favourites
  has_many :users, through: :favourites
  has_one_attached :image
  
  validates :house_name, :city, :image, :address, :description_short, :price, presence: true
  

  def image_url
    url_for(image)
  end
end
