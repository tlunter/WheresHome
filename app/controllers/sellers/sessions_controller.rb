class Sellers::SessionsController < Devise::SessionsController
  def create
    sign_out
    super
  end
end
