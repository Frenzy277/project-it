class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :management, :edit, :update, :destroy]
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

    if @project.save
      flash[:notice] = "Project has been created."
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

  private

    def project_params
      params.require(:project).permit(:name, :github_url)
    end

    def set_project
      @project = Project.find_by slug: params[:id]
    end
    
end