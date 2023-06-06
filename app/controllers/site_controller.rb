class SiteController < ApplicationController   
  def index
    @retailer = current_user.retailer
    @customers = @retailer.customers
    render :index, locals: { retailer: @retailer, customers: @customers }
  end
end
