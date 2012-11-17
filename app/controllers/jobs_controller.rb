class JobsController < ApplicationController
  
  before_filter :require_login, only: [:index, :new, :edit, :create, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  
  # GET /jobs
  # GET /jobs.json
  def index
    @job = current_user.job
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
    @job = current_user.jobs.build(params[:job])
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
    redirect_to users_url
  end


  private
    def require_login
      unless logged_in?
        flash[:error] = "Only logged in users can add edit their jobs"
        redirect_to :back
      end
    end

    def correct_seller
      @job = current_user.jobs.find_by_id(params[:id])
      unless @job
        flash[:error] = "You cannot modify someone else's job"
        redirect_to :back
      end
    end

    # 'bool-ize' the current_seller
    def logged_in?
      !!current_user
    end
  
end
