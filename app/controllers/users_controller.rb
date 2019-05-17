class UsersController < ApplicationController
    def new
        
    end

    def create
        @user = User.new(user_params)
        # respond_to do |format|
          if @user.save
    
            # Tell the UserMailer to send a welcome email after save
            UserMailer.welcome_email(@user).deliver_later
            
            # only default testing pages below
            # format.html { redirect_to(@user, notice: 'User was successfully created.') }
            # format.json { render json: @user, status: :created, location: @user }
          
            # set the session model 
            session[:user_id] = @user.id
            redirect_to '/'
          else
            # send another test email <IF> signup not successful
            # format.html { render action: 'new' }
            # format.json { render json: @user.errors, status: :unprocessable_entity }
            # redirect IF not sucessful signup
            redirect_to '/signup'
          end
        # end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
