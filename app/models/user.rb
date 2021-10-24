class User < ApplicationRecord
    has_secure_password
    
    has_many :favourites
    has_many :houses, through: :favourites

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates_uniqueness_of :username
    validates :username, :email, presence: true
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
