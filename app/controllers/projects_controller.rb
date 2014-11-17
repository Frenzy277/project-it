class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :like, :management]
  before_action :require_user
  before_action :require_member, only: [:management]
  before_action :require_manager, only: [:edit, :update, :destroy]

  def index
    @projects = Project.based_on_selected_tab(params)

    respond_to do |format|
      format.html
      format.js
    end
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
    if @project.update(project_params)
      @project.manager = params[:project][:manager_id].to_i
      flash[:success] = "Successfully updated your project."
      redirect_to management_project_url(@project)
    else
      render :edit
    end
  end

  def destroy
  end

  def management
  end

  def like
    @like = Like.create(user_id: current_user.id, likeable: @project, like: true)

    respond_to do |format|
      format.html do 
        if @like.valid?
          flash[:success] = "Your like has been counted."
        else
          flash[:danger] = "You already liked #{project.project_name}."
        end

        redirect_to :back
      end
      
      format.js
    end
  end

  private

    def project_params
      params.require(:project).permit(:project_name, :project_description, :status, :end_date,
                                      :github_url, :heroku_url, :team, category_ids: [])
    end

    def set_project
      @project = Project.find_by slug: params[:id]
    end

    def require_manager
      restricted_area if logged_in? && @project.manager != current_user
    end
    
end