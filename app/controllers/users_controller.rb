class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You are registered."
      redirect_to root_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was updated."
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def set_user
    @user = User.find_by(slug: params[:id])
  end
end