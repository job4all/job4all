class ProfessionsController < ApplicationController
  before_action :set_profession, only: [:show, :edit, :update, :destroy]
  before_filter :admin

  def index
    @professions = Profession.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  def new
    @profession = Profession.new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @profession = Profession.new(profession_params)

    respond_to do |format|
      if @profession.save
        format.html { redirect_to @profession, notice: 'Profession was successfully created.' }
        format.json { render :show, status: :created, location: @profession }
      else
        format.html { render :new }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profession.update(profession_params)
        format.html { redirect_to @profession, notice: 'Profession was successfully updated.' }
        format.json { render :show, status: :ok, location: @profession }
      else
        format.html { render :edit }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profession.destroy
    respond_to do |format|
      format.html { redirect_to professions_url, notice: 'Profession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profession
      @profession = Profession.find(params[:id])
    end

    def profession_params
      params.require(:profession).permit(:name)
    end

    def admin
      @user = current_user
     unless current_user && User.find_by(email: "job4allteam@gmail.com") == current_user
      flash[:alert] = 'Access denied..! Please login as admin.'
      redirect_to root_path
     end
    end
end
