class Customer < ApplicationRecord
    has_many :purchases
    has_many :retailers, through: :purchases
end
