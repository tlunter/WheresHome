module ApplicationHelper
  def who_is_signed_in?
    if current_seller
      :seller
    elsif current_buyer
      :buyer
    else
      nil
    end
  end
end
