class PasswordController <ApplicationController
    before_action :required_user_logged_in!

    def edit
    end

    def update 
        if Current.user.update(password_params)
            redirect_to root_path, notice:"Password updated!"
        else
            render :edit
        end
        puts "my god #{Current.user.errors.full_messages}"
    end

    private

    def password_params
        
        params.require(:user).permit(:password, :password_confirmation)
        
    end
end