class Buyers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  def linkedin
    @buyer = Buyer.find_for_linkedin_oauth(request.env["omniauth.auth"], current_buyer)

    logger.debug "Buyer: #{@buyer.to_yaml}"
    if @buyer.persisted?
      sign_out
      sign_in_and_redirect @buyer, event: :authentication
      remember_me @buyer
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "LinkedIn"
    else
      redirect_to root_url
    end
  end
end
