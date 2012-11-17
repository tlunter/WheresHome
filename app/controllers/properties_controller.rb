class PropertiesController < ApplicationController
  before_filter :require_login, only: [:index, :create, :new, :edit, :update, :destroy]
  before_filter :correct_seller, only: [:edit, :update, :destroy]

  def index
    @properties = current_seller.properties
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = current_seller.properties.build(params[:property])
    respond_to do |format|
      if @property.save
        redirect_to @property
      else
        render 'new'
      end
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
    redirect_to current_seller
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
