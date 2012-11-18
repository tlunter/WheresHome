class Buyers::RegistrationsController < Devise::RegistrationsController
  before_filter :require_buyer, only: [:edit, :update]

  def update
    buyer_params = params[:buyer]
    cleaned_buyer_params = {}
    cleaned_buyer_params[:first_name] = buyer_params[:first_name]
    cleaned_buyer_params[:last_name] = buyer_params[:last_name]
    cleaned_buyer_params[:phone_number] = buyer_params[:phone_number]
    if current_buyer.update_attributes(cleaned_buyer_params)
      flash[:success] = "Buyer updated!"
      redirect_to :root
    else
      render 'edit'
    end
  end

  private
  def require_buyer
    if current_buyer.nil?
      flash[:error] = "Can't update your buyer account unless you're logged in"
      redirect_to :back
    end
  end
end
