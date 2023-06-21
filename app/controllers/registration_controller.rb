class RegistrationController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # params 
        # {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"test@test.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Signup"}
        # params[:user]
        # {"email"=>"test@test.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice:"Successfully created account"
        else
            flash[:alert] = "Something went wrong"
            render :new
        end
        if @user.errors.any?
            puts "hellllllo#{@user.errors.full_messages}"
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end