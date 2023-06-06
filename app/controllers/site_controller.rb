class SiteController < ApplicationController
  def index
    @question = "Let's begin"
    render :new
  end
end
