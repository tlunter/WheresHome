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
    @applications = @applications.each do |app|
      names = []
      app.roommates.each do |r|
        combined_name = "#{r.buyer.first_name} #{r.buyer.last_name}"
        names.push combined_name
      end
      app[:names] = names
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

  def create
    case who_is_signed_in?
    when :buyer
      property = Property.find_by_id params[:application][:property]
      logger.debug "Property: #{property}"
      params[:application][:property] = nil
      @application = current_buyer.applications.build params[:application]
      @application.property = property
      @application.buyers << current_buyer
      if @application.save
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
      @application.destroy
      redirect_to "applications#index"
    else
      flash[:error] = "Only logged in buyers can delete their applications"
      redirect_to root_url
    end
  end

end
