class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]
  
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
  
    private
  
    def set_customer
      @customer = Customer.find(params[:id])
    end
  
    def customer_params
      params.require(:customer).permit(:name, :last_name, :email, :phone, :age)
    end

    def associated_retailers
        retailers = @customer.retailers
        retailers_data = retailers.map do |retailer|
          {
            id: retailer.id,
            url: retailer.image_url,
            coordinates: [retailer.coordinate_x, retailer.coordinate_y],
            diameter: retailer.diameter
          }
        end
    
        render json: { associated_retailers: retailers_data }
    end
    
  end
  