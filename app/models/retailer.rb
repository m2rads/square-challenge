class Retailer < ApplicationRecord
    belongs_to :user
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

    def self.from_omniauth(auth)
        raw_info = auth[:extra][:raw_info]
    
        business_name = raw_info[:merchant][0][:business_name]
        owner_name = auth[:info][:name]
        owner_email = raw_info[:merchant][0][:owner_email]
    
        create!(
          business_name: business_name,
          owner: owner_name,
          email: owner_email
        )
    end
end
