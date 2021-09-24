class Favourite < ApplicationRecord
  validates :user_id, :house_id, presence: true

  belongs_to :user
  belongs_to :house
end
