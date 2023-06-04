class RetailersController < ApplicationController
    before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  
    def index
      @retailers = Retailer.all
    end
  
    def show
    end
  
    def new
      @retailer = Retailer.new
    end
  
    def create
      @retailer = Retailer.new(retailer_params)
  
      if @retailer.save
        create_customers(params[:customer_names]) if params[:customer_names].present?
        redirect_to @retailer, notice: 'Retailer was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @retailer.update(retailer_params)
        redirect_to @retailer, notice: 'Retailer was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @retailer.destroy
      redirect_to retailers_url, notice: 'Retailer was successfully destroyed.'
    end
  
    private
  
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end
  
    def retailer_params
      params.require(:retailer).permit(:name, :business_name, :owner, :email, :phone, :image_url, :diameter, :coordinate_x, :coordinate_y)
    end
  
    def create_customers(customer_names)
        customer_names.each do |name|
          customer = Customer.find_or_initialize_by(name: name)
      
          if customer.new_record?
            customer.save
          end
      
          Purchase.create(retailer: @retailer, customer: customer)
        end
      end      
  end
  