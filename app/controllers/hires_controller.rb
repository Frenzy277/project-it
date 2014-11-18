class HiresController < ApplicationController
  before_action :set_project
  before_action :require_user
  before_action :require_manager 

  def new
  end

  def create
    user = User.find_by username: params[:username]

    if user
      if !@project.users.include?(user)
        @project.users << user
        flash[:success] = "User #{user.username} was added to project #{@project.title}"
        redirect_to management_project_url(@project)
      else
        flash.now[:danger] = "User #{user.username} is already a member of project: #{@project.title}"
        render :new
      end
    else
      flash.now[:danger] = "Incorrect username."
      render :new
    end
  end
  
  private

  def set_project
    @project = Project.find_by slug: params[:project_id]
  end


end