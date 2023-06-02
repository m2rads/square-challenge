class CustomersController < ApplicationController
    def create
      @customer = Customer.find_or_initialize_by(name: params[:name])
      @store = Store.find_by(store_number: params[:store_number])
  
      if @customer.persisted? # Customer already exists
        @customer.stores << @store unless @customer.stores.include?(@store)
        @customer.update(image_url: @store.image_url)
      else # Create a new customer
        @customer.stores << @store
        @customer.save
      end
  
    end
  end
  