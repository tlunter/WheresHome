class LocationsController < ApplicationController
  def index
    if current_buyer.nil?
      flash[:error] = "You must be a signed in to get a location index"
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
    case who_is_signed_in
    when :seller
      @location = current_seller.properties.find_by_id(params[:property_id]).location.build(params[:location])
    when :user
      if params[:job_id].nil?
        @location = current_buyer.locations.build(params[:job])
      else
        @location = current_buyer.jobs.find_by_id(params[:job_id]).location.build(params[:location])
      end
    else
      flash[:error] = "You must be signed in to create a location"
      redirect_to :back
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    case who_is_signed_in?
    when :seller
      flash[:error] = "Sellers have no locations to destroy"
    when :buyer
      current_buyer.locations.find_by_id(params[:id]).destroy
      flash[:success] = "Location destroyed"
      redirect_to current_buyer
    else
      flash[:error] = "You must be a signed in buyer to delete a location"
    end
  end
end
