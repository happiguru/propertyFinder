class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { maximum: 4}
end
