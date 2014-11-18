class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      Message.create(recipient: @user, sender_id: 1, body: welcome_message)
      flash[:success] = "You are registered. Now you may sign in."
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    # Normal and AJAX request
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was updated."
      redirect_to @user
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

    def require_same_user
      restricted_area unless current_user == @user
    end

    def welcome_message
      title = "Welcome #{@user.username}, Thank you for registering for this awesome project."
      body = " As first step, I encourage you to create a project (select from Projects dropdown) and manage it from start to end. Also select a nice picture from Internet 
              and update your project with it. Its recommended to leave your GitHub repo and Heroku url in your project profile. 
              Registered users can like your finished project and increase your chances to be on the main page. If you dont like it, you can also join
              another project! Yes, just go to All projects page and check all projects that are hiring. Click on the project name and then
              click on send a message to a project manager. Now, what are you waiting for?"
      footer = " Enjoy and have fun. Tomas"
      title + body + footer
    end
end


















