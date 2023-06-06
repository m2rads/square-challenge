class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy, :associated_retailers]

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    render json: @customer
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    render json: { note: "Customer destroyed successfully" }
  end

  def associated_retailers
    @customer = Customer.find_by(email: params[:email]) # Find customer by email

    if @customer.nil?
      render json: { error: "Customer not found" }, status: :not_found
    else
      retailers = @customer.retailers
      retailers_data = retailers.map do |retailer|
        {
          retailer.id.to_s => {
            url: retailer.image_url,
            coordinates: [retailer.coordinate_x, retailer.coordinate_y],
            diameter: retailer.diameter
          }
        }
      end

      render json: { associated_retailers: retailers_data }
    end
  end

  private

  def set_customer
    @customer = Customer.find_by(email: params[:email]) # Find customer by email
    if @customer.nil?
      render json: { error: "Customer not found" }, status: :not_found
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :last_name, :email, :phone, :age)
  end
end
