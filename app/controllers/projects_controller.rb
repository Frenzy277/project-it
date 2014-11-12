class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to root_url
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

  private

    def project_params
      params.require(:project).permit(:name, :github_url)
    end

    def set_project
      @project = Project.find_by slug: params[:id]
    end
end