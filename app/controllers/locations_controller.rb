class LocationsController < ApplicationController
  def index
    if current_buyer.nil?
      flash[:error] = "You must be a signed in buyer to get a location index"
      redirect_to :back
    else
      @locations = current_buyer.locations
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    case who_is_signed_in?
    when :seller
      flash[:error] = "Sellers should add locations by properties only"
    when :buyer
      if params[:job_id].nil?
        @location = current_buyer.locations.build(params[:location])
      else
        @location = current_buyer.jobs.first_by_id(params[:job_id]).location.build(params[:location])
      end
    else
      flash[:error] = "You must be signed in to create a location"
      redirect_to :back
    end
  end

  def update
    case who_is_signed_in?
    when :seller
      flash[:error] = "Sellers have no locations to update"
    when :buyer
      @location = current_buyer.locations.first_by_id(params[:id])
      if @location.update_attributes(params[:location])
        flash[:success] = "Location updated"
        redirect_to current_buyer
      else
        render 'edit'
      end
    else
      flash[:error] = "You must be a signed in buyer to update a location"
    end
  end

  def destroy
    case who_is_signed_in?
    when :seller
      flash[:error] = "Sellers have no locations to destroy"
    when :buyer
      current_buyer.locations.first_by_id(params[:id]).destroy
      flash[:success] = "Location destroyed"
      redirect_to current_buyer
    else
      flash[:error] = "You must be a signed in buyer to delete a location"
    end
  end
end
