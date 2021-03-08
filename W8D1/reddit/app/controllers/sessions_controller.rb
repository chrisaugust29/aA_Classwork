class SessionsController < ApplicationController
  before_action :require_signed_in!

  def new
    render: new
  end

  def create
    @user = User.self_find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      sign_in!(@user)
      redirect_to subs_url
    else
      flash.now[:error] = ["Wrong Password"]
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end
end
