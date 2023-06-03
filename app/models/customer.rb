class Customer < ApplicationRecord
    has_many :purchases
    has_many :retailers, through: :purchases

    attribute :name, :string
    attribute :last_name, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :age, :integer
end
