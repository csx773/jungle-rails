class UsersController < ApplicationController
    def new
        
    end

    def create
        @user = User.new(user_params)
          if @user.save
    
            # Tell the UserMailer to send a welcome email after save
            UserMailer.welcome_email(@user).deliver_later
            
          
            # set the session model 
            session[:user_id] = @user.id
            redirect_to '/'
          else

            # redirect IF not sucessful signup
            redirect_to '/signup'
          end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
