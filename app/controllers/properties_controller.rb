class PropertiesController < ApplicationController
  before_filter :require_login, only: [:index, :create, :new, :edit, :update, :destroy]
  before_filter :correct_seller, only: [:edit, :update, :destroy]

  def index
    @properties = current_seller.properties
  end

  def search
    real_params = params[:property] or {
      min_price: '0',
      max_price: '0',
      bedrooms: '0',
      full_bathrooms: '0',
      half_bathrooms: '0',
      location_attributes: {
        city: '',
        state: ''
      }
    }

    if real_params

      scope = Property
      scope = scope.where("#{real_params[:min_price].to_i} <= price") unless real_params[:min_price].blank? or real_params[:min_price].to_i == 0
      scope = scope.where("#{real_params[:max_price].to_i} >= price") unless real_params[:max_price].blank? or real_params[:max_price].to_i == 0
      scope = scope.where("#{real_params[:bedrooms].to_i} == bedrooms") unless real_params[:bedrooms].blank? or real_params[:bedrooms].to_i == 0
      scope = scope.where("#{real_params[:full_bathrooms].to_i} == full_bathrooms") unless real_params[:full_bathrooms].blank? or real_params[:full_bathrooms].to_i == 0
      scope = scope.where("#{real_params[:half_bathrooms].to_i} == half_bathrooms") unless real_params[:half_bathrooms].blank? or real_params[:half_bathrooms].to_i == 0

      @properties = scope.all
      @properties.each do |p|
        if not real_params[:location_attributes][:city].blank? and p.location[:city] != real_params[:location_attributes][:city]
          @properties.delete p
        elsif not real_params[:location_attributes][:state].blank? and p.location[:state].upcase != real_params[:location_attributes][:state].upcase
          @properties.delete p
        end
      end

    else
      @properties = Property.all
    end

    @property = Property.new
    @property.location = Location.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @property.location = Location.new
  end

  def edit
  end

  def create
    @property = current_seller.properties.build(params[:property])
    if @property.save
      redirect_to @property
    else
      render 'new'
    end
  end

  def update
    if @property.update_attributes(params[:property])
      flash[:success] = "Property updated"
      redirect_to @property
    else
      render 'edit'
    end
  end

  def destroy
    @property.destroy
    flash[:success] = "Property destroyed"
    redirect_to root_url
  end

  private
    def require_login
      unless logged_in?
        flash[:error] = "Only logged in sellers can add a edit their jobs"
        redirect_to root_url
      end
    end

    def correct_seller
      @property = current_seller.properties.find_by_id(params[:id])
      unless @property
        flash[:error] = "You cannot modify a property that you do not own"
        redirect_to root_url
      end
    end

    # 'bool-ize' the current_seller
    def logged_in?
      !!current_seller
    end

end
