class RetailersController < ApplicationController
    before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  
    def index
      @retailers = Retailer.all
      render json: @retailers
    end
  
    def show
      @retailer = Retailer.find(params[:id])
      render json: @retailer
    end
  
    def new
      @retailer = Retailer.new
      render json: @retailer
    end
  
    def create
      @retailer = Retailer.new(retailer_params)
  
      if @retailer.save
        create_customers(params[:customer_emails]) if params[:customer_emails].present?
        render json: @retailer, status: :created
      else
        render json: { error: "Failed to create retailer" }, status: :unprocessable_entity
      end
    end
  
    def update
      if @retailer.update(retailer_params)
        render json: @retailer
      else
        render json: { error: "Failed to update retailer" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @retailer.destroy
      render json: { note: "Retailer destroyed successfully" } 
    end
  
    private
  
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end
  
    def retailer_params
      params.require(:retailer).permit(:business_name, :owner, :email, :phone, :image_url, :diameter, :coordinate_x, :coordinate_y)
    end
  
    def create_customers(customer_emails)
        customer_emails.each do |email|
          customer = Customer.find_or_initialize_by(email: email)
      
          if customer.new_record?
            customer.save
          end
      
          Purchase.create(retailer: @retailer, customer: customer)
        end
      end      
  end
  