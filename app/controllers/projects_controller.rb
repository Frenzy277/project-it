class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :management, :edit, :update, :destroy, :like]
  before_action :require_user
  before_action :require_member, only: [:management]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user
    @project.manager = current_user
    @project.team = true if params[:project][:team]
 

    if @project.save
      flash[:success] = "Project has been created."
      redirect_to management_project_url(@project)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def management
  end

  def like
    like = Like.create(user_id: current_user.id, likeable: @project, like: true)
    redirect_to :back
  end

  private

    def project_params
      params.require(:project).permit(:project_name, :project_description, :end_date,
                                      :github_url, :heroku_url, category_ids: [])
    end

    def set_project
      @project = Project.find_by slug: params[:id]
    end
    
end