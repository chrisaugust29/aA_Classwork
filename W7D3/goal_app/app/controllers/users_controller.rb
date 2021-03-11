class UsersController < ApplicationController
  def index 
    @user = User.all 
    render :index
  end 

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new 
    render :new 
  end
  
  def create
    @user = User.new(user_params)
        if user.save
            log_in_user!(@user)
            redirect_to user_url()
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
