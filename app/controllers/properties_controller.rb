class PropertiesController < ApplicationController
  before_filter :require_login, only: [:create, :new, :edit, :update, :destroy]
  before_filter :correct_seller, only: [:edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = current_seller.properties.create(params[:property])
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "Only logged in sellers can add a new property"
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
