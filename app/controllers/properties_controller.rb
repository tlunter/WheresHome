class PropertiesController < ApplicationController
  before_filter :require_login, only: [:create, :new, :edit, :update, :destroy]
  before_filter :correct_seller, only: [:edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    unless params[:city] and params[:state]
      flash[:error] = "You must provide a valid city and state to search for properties"
      redirect_to :back
    end
    @properties = Property.find_by_city_and_state(params[:city], params[:state])
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_seller.properties.build(params[:property])
    respond_to do |format|
      if @property.save
        flash[:success] = "Property at #{@property.location} created"
        redirect_to sellers_url
      else
        render 'new'
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update_attributes(params[:property])
        flash[:success] = "Property updated"
        redirect_to sellers_url
      else
        render 'edit'
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    flash[:success] = "Property destroyed"
    redirect_to sellers_url
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "Only logged in sellers can add a edit their jobs"
      redirect_to :back
    end
  end

  def correct_seller
    @property = current_seller.properties.find_by_id(params[:id])
    unless @property
      flash[:error] = "You cannot modify a property that you do not own"
      redirect_to :back
    end
  end

  # 'bool-ize' the current_seller
  def logged_in?
    !!current_seller
  end

end
