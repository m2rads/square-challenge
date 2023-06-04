class SiteController < ApplicationController
  def index
    @question = "Let's begin"
  end

  def dashboard
    @retail = "new retailer"

    # Render a JSON response with the necessary data for your React component
    # render json: { retail: @retail }
  end
end
