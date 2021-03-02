class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user.id)
        else 
            render :new
        end
    end

    private 
    def  user_params
        params.require(:user).permit(:password, :username)
    end

    # password123 + salt(sndfu02839fdun0e)
    # into the hash BCrypt
    # 21347890213yrndf8un0312rf8 < --pasword digest
    # $10$2$   21347890213yrndf8un0312rf8 sndfu02839fdun0e
end
