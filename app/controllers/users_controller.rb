class UsersController < ApplicationController
  before_action :authenticate, :get_user, :authorize, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      signin
      redirect_to @user, flash: { success: "Successfully signed up" }
    else
      flash.now[:danger] = "Sorry, but something went wrong."
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :phone, :password)
    end

    def get_user
      @user = User.find_by_id(params[:id])
    end
end
