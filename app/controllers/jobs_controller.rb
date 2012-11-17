class JobsController < ApplicationController
  
  before_filter :require_login, only: [:index, :new, :edit, :create, :update, :destroy]
  before_filter :correct_buyer, only: [:edit, :update, :destroy]
  
  def index
    @jobs = current_buyer.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = current_buyer.jobs.build(params[:job])
    if @job.save
      flash[:success] = "Job created"
      redirect_to @job
    else
      render 'new'
    end
  end

  def update
    if @job.update_attributes(params[:job])
      flash[:success] = "Job updated"
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    flash[:success] = "Job destroyed"
    redirect_to current_buyer
  end


  private
    def require_login
      unless logged_in?
        flash[:error] = "Only logged in buyers can add edit their jobs"
        redirect_to :back
      end
    end

    def correct_buyer
      @job = current_buyer.jobs.find_by_id(params[:id])
      unless @job
        flash[:error] = "Only logged in buyers can add edit their jobs"
        redirect_to :back
      end
    end

    # 'bool-ize' the current_seller
    def logged_in?
      !!current_buyer
    end
  
end
