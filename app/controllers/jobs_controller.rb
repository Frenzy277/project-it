class JobsController < ApplicationController
  before_action :require_user
  before_action :set_project, only: [:new, :create]
  before_action :set_job, only: [:show, :edit, :update, :destroy, :done]
  before_action :require_manager, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_member

  def index
  end

  def new
    @job = @project.jobs.build
  end

  def create
    @job = @project.jobs.build(job_params)

    if @job.save
      flash[:success] = "Job created"
      redirect_to management_project_url(@project)
    else
      render :new
    end
  end

  def show
    #maybe Todo
  end

  def edit; end

  def update
    if @job.update(job_params)
      flash[:success] = "Job has been updated."
      redirect_to management_project_url(@project)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end 
  end

  def done
    @job.update(status: "completed")

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private

    def job_params
      params.require(:job).permit(:name, :description, :status, :deadline, :user_id)
    end

    def set_job
      set_project
      @job = Job.find params[:id]
    end

    def set_project
      @project = Project.find_by slug: params[:project_id]
    end
   
end