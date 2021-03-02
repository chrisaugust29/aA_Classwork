class SessionsController < ApplicationController
    def new
        render :new
    end


    def create
        @user = User.find_by_credentials(
          params[:user][:username],
          params[:user][:password]
        )
        sign_in!(@user)
        redirect_to users_url
      end
    
      def destroy
        sign_out!
        redirect_to new_session_url
      end


end
