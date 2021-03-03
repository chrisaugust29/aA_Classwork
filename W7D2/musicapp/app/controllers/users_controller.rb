class UsersController < ApplicationController
    #new uses new.html form to create a user 
    def new
        render :new
    end
    #after hitting the form it gets sent to create function then you log in user
    def create 
        @user = User.new(user_params)
        if @user.save   
            log_in_user!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def destroy

    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password)
    end

end
