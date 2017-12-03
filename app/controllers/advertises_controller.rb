class AdvertisesController < ApplicationController
require 'nexmo'
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]
  before_filter :admin, only: [:new, :edit, :update, :destroy]
  
  def index
      @advertises = Advertise.search(params[:term])  
    @user = current_user
    @job = Job.new
  end

  def show
    @job = Job.new
    @jobs = Job.all
  end

  def new
    @advertise = Advertise.new
  end

  def edit
  end

  def create
    @advertise = Advertise.new(advertise_params)

    @user = User.find_by_id(params[:user])
    respond_to do |format|
      if @advertise.save
        User.all.each do |user|
           AdvertiseMailer.adveritse_mail_sending(@advertise, user).deliver!
          nexmo = Nexmo::Client.new(key: '74ccd423', secret: '8723c9505683cdd8')
          nexmo.send_message(from: 'Ruby', to: '03138256569', text: @advertise.title)
       end

        format.html { redirect_to @advertise, notice: 'Advertise was successfully created.' }
        format.json { render :show, status: :created, location: @advertise }
      else
        format.html { render :new }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @advertise.update(advertise_params)
        format.html { redirect_to @advertise, notice: 'Advertise was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertise }
      else
        format.html { render :edit }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @advertise.destroy
    respond_to do |format|
      format.html { redirect_to advertises_url, notice: 'Advertise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_advertise
      @advertise = Advertise.find(params[:id])
      @user = current_user
    end

    def advertise_params
      params.require(:advertise).permit(:term, :newspaper_id, :title, :state, :description, :idate, :lastdate, :organization_id, :image)
    end

    def admin
      @user = current_user
     unless current_user && User.find_by(email: "job4allteam@gmail.com") == current_user
      flash[:alert] = 'Access denied..! Please login as admin.'
      redirect_to @user
     end
    end
end
