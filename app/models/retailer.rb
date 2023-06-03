class Retailer < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    attribute :business_name, :string
    attribute :owner, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :image_url, :string
    attribute :diameter, :float
    attribute :coordinate_x, :float
    attribute :coordinate_y, :float
end
