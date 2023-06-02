class CustomersController < ApplicationController
  def create
    @customer = Customer.find_or_initialize_by(name: params[:name])
    @store = Store.find_by(store_number: params[:store_number])

    if @store.nil?
      render json: { error: "Store not found" }, status: :not_found
    elsif @customer.persisted? # Customer already exists
      @customer.stores << @store unless @customer.stores.include?(@store)
      @customer.update(image_url: @store.image_url)
      render json: @customer, status: :ok
    else # Create a new customer
      @customer.stores << @store
      if @customer.save!
        render json: @customer, status: :created
      else
        render json: { error: "Failed to create customer" }, status: :unprocessable_entity
      end
    end
  end
end
