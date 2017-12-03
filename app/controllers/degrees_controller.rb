class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]
  before_filter :admin
  
  def index
    @degrees = Degree.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  def new
    @degree = Degree.new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @degree = Degree.new(degree_params)

    respond_to do |format|
      if @degree.save
        format.html { redirect_to @degree, notice: 'Degree was successfully created.' }
        format.json { render :show, status: :created, location: @degree }
      else
        format.html { render :new }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @degree.update(degree_params)
        format.html { redirect_to @degree, notice: 'Degree was successfully updated.' }
        format.json { render :show, status: :ok, location: @degree }
      else
        format.html { render :edit }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to degrees_url, notice: 'Degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_degree
      @degree = Degree.find(params[:id])
    end

    def degree_params
      params.require(:degree).permit(:tdegree_id, :name)
    end

    def admin
      @user = current_user
     unless current_user && User.find_by(email: "job4allteam@gmail.com") == current_user
      flash[:alert] = 'Access denied..! Please login as admin.'
      redirect_to root_path
     end
    end
end
