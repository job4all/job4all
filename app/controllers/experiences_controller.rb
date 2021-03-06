class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = current_user.experiences.all
  end

  def show
  end

  def new
    @experience = current_user.experiences.new
  end

  def edit
  end

  def create
    @experience = current_user.experiences.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_experience
      @experience = current_user.experiences.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:designation, :profession_id, :city_id, :organization_id, :start_date, :end_date, :user_id)
    end
end
