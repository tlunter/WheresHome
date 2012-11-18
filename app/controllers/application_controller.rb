class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :seller_or_buyer
  include ApplicationHelper

  private
  def after_sign_in_path_for(resource)
    if resource.is_a? Buyer
      :edit_buyer_registration
    else
      super
    end
  end

  def seller_or_buyer
    if seller_signed_in? and buyer_signed_in?
      sign_out
      flash[:error] = "Cannot have a buyer and a seller logged in at the same time!"
      redirect_to root_url
    end
  end
end
