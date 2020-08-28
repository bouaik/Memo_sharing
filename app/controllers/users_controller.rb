class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show]

    def index
        @users = User.all
    end

    def show
    end



    private

    def set_user
        @user = User.find(params[:id])
    end

    def users_params
       params.require(:user).permit(:id)
    end
end