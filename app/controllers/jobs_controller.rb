class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :admin
  def index
    @jobs = Job.search(params[:search])

    
    @user = current_user
  end

  def show
    @user = current_user
  end

  def new
    @job = Job.new
    @user = current_user
  end

  def edit
  
  end

  def create
    @advertise = Advertise.find(params[:advertise_id])
    @job = @advertise.jobs.create(job_params)
    redirect_to @advertise
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  @advertise = Advertise.find(params[:advertise_id])
    @job = @advertise.jobs.find(params[:id])
    @job.destroy
    redirect_to advertise_path(@advertise)
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:advertise_id, :profession_id, :qty, :degree_id, :city_id, :search)
    end

    def admin
      @user = current_user
     unless current_user && User.find_by(email: "job4allteam@gmail.com") == current_user
      flash[:alert] = 'Access denied..! Please login as admin.'
      redirect_to root_path
     end
    end
    
end
