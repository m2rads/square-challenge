class SiteController < ApplicationController  
  skip_before_action :verify_authenticity_token, only: [:upload_image]
 
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

  def upload_image
    @retailer = current_user.retailer
    diameter = params[:diameter]
    x_coordinate = params[:x_coordinate]
    y_coordinate = params[:y_coordinate]

    # Upload image to Cloudinary
    cloudinary_service = CloudinaryService.instance
    image = params[:image]
    cloudinary_response = cloudinary_service.upload_image(image.tempfile, @retailer.id.to_s)

    # Update retailer database with the diameter, x-coordinate, and y-coordinate
    @retailer.update(diameter: diameter, coordinate_x: x_coordinate, coordinate_y: y_coordinate)

    # Save the Cloudinary URL in the retailer's image field
    @retailer.update(image_url: cloudinary_response['secure_url'])

    redirect_to dashboard_path, notice: 'Image uploaded successfully'
  end
end
