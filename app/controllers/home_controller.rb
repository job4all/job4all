class HomeController < ApplicationController
  def index
  	@advertises = Advertise.all
  	
  end

  def home
  end

  def contact
  end

  def aboutus
  end
  
  def show
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
  
end
