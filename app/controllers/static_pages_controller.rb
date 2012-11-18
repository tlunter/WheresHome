class StaticPagesController < ApplicationController
  def index
    if buyer_signed_in?
      redirect_to controller: :properties, action: :search
    elsif seller_signed_in?
      redirect_to controller: :properties, action: :index
    else
      render 'index.html.erb', layout: false
    end
  end

  def about
  end

  def contact
  end

  def landing
  end
end
