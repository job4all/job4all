class UsersController < ApplicationController

    def panal
      @user = current_user
    end

    def edit_profile
      @user = current_user
    end

    def show_profile
      @user = current_user
    end

    def update_profile

      @user = current_user
      respond_to do |format|
        if @user.update(user_params)
            format.html {redirect_to root_path, notice: 'user was successfully created.'}
        else
          format.html { render action: "edit" }
        end
      end  
    end 


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :mobile, :fname, :dob, :cnic, :gender,  :address, :skills, :resume, :city_id, :state_id)
    end
end
