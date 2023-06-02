class Store < ApplicationRecord
    belongs_to :retailer
    has_and_belongs_to_many :customers
    has_one_attached :image_url
end