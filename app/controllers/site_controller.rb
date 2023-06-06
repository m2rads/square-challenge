class SiteController < ApplicationController   
  def index
    @retailer = current_user.retailer
    @customers = @retailer.customers
    puts "----------here we go-------"
    if @customers.nil?
      puts "No customers found."
    else
      @customers.each do |customer|
        puts "Customer Name: #{customer.name}"
        puts "Customer Email: #{customer.email}"
      end
    end
    render :index, locals: { retailer: @retailer, customers: @customers }
  end
end
