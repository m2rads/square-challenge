class Retailer < ApplicationRecord
  belongs_to :user, dependent: :destroy
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

  def self.from_omniauth(auth, user)
    raw_info = auth[:extra][:raw_info]

    business_name = raw_info[:merchant][0][:business_name]
    owner_name = auth[:info][:name]
    owner_email = raw_info[:merchant][0][:owner_email]

    retailer = find_or_initialize_by(email: owner_email)
    retailer.update!(
      business_name: business_name,
      owner: owner_name,
      user: user
    )

    # Retrieve the customer list from Square API
    access_token = auth[:credentials][:token]
    customers_response = HTTParty.get('https://connect.squareupsandbox.com/v2/customers',
                                       headers: { 'Authorization' => "Bearer #{access_token}" })
    customers_data = customers_response['customers']

    # Create or update customers associated with the retailer
    customers_data.each do |customer_data|
      customer = Customer.find_or_initialize_by(square_customer_id: customer_data['id'])
      customer.update!(
        name: customer_data['given_name'],
        last_name: customer_data['last_name'],
        email: customer_data['email_address'],
        phone: customer_data['phone_number']
      )
      Purchase.create!(retailer: retailer, customer: customer)
    end
  end
end
