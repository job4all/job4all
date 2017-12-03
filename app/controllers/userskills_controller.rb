class UserskillsController < ApplicationController
  before_action :set_userskill, only: [:show, :edit, :update, :destroy]
  
  def index
    @userskills = current_user.userskills.all
  end

  def show
  end

  def new
    @userskill = current_user.userskills.new
  end

  def edit
  end

  def create
    @userskill = current_user.userskills.new(userskill_params)

    respond_to do |format|
      if @userskill.save
        format.html { redirect_to @userskill, notice: 'Userskill was successfully created.' }
        format.json { render :show, status: :created, location: @userskill }
      else
        format.html { render :new }
        format.json { render json: @userskill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @userskill.update(userskill_params)
        format.html { redirect_to @userskill, notice: 'Userskill was successfully updated.' }
        format.json { render :show, status: :ok, location: @userskill }
      else
        format.html { render :edit }
        format.json { render json: @userskill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @userskill.destroy
    respond_to do |format|
      format.html { redirect_to userskills_url, notice: 'Userskill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_userskill
      @userskill = current_user.userskills.find(params[:id])
    end

    def userskill_params
      params.require(:userskill).permit(:skill_id, :user_id, :lastd)
    end
end
