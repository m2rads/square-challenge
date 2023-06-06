class SiteController < ApplicationController   
  def index
    @retailer = Retailer.find("980190968")
    render :index, locals: { retailer: @retailer }
  end
end
