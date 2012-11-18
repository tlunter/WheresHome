class ApplicationsController < ApplicationController
  def index
    case who_is_signed_in?
    when :seller
      @applications = []
      current_seller.properties.each do |p|
        @applications += p.applications
      end
    when :buyer
      if current_buyer.roommates.empty?
        @applications = []
      else
        @applications = current_buyer.applications
      end
    else
      flash[:error] = "Y'all dun goofed, go sign in or someshiz"
      redirect_to root_url
    end
  end

  def show
    @application = Application.find_by_id(params[:id])
  end

  def new
    case who_is_signed_in?
    when :buyer
      property = Property.find_by_id(params[:property_id])
      @application = Application.new
      @application.property = property
    else
      flash[:error] = "You need to be a buyer to make an Application"
      redirect_to root_url
    end
  end

  def edit
  end

  def create
    case who_is_signed_in?
    when :buyer
      property = Property.find_by_id params[:application][:property]
      params[:application][:property] = nil
      @application = current_buyer.applications.build params[:application]
      if @application.save
        @application.property = property
        @application.buyers << current_buyer
        flash[:success] = "You have successfully submitted your application!"
        redirect_to root_url
      else
        render "new"
      end
    else
      flash[:error] = "Only logged in buyers can bid on an apartment!"
      redirect_to root_url
    end
  end

  def destroy
    case who_is_signed_in?
    when :buyer
      @application = current_buyer.applications.find_by_id(params[:id])
      logger.debug "Application: #{@application}"
      @application.destroy
      redirect_to "applications#index"
    else
      flash[:error] = "Only logged in buyers can delete their applications"
    end
  end

end
