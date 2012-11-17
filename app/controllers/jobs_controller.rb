class JobsController < ApplicationController
  
  before_filter :require_login, only: [:index, :new, :edit, :create, :update, :destroy]
  before_filter :correct_buyer, only: [:edit, :update, :destroy]
  
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = current_buyer.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_buyer.jobs.build(params[:job])
    if @job.save
      flash[:success] = "Job created"
      redirect_to @job
    else
      render 'new'
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    if @job.update_attributes(params[:job])
      flash[:success] = "Job updated"
      redirect_to @job
    else
      render 'edit'
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
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
