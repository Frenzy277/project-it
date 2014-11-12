class JobsController < ApplicationController
  before_action :require_user
  before_action :set_project, only: [:new, :create]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :require_member

  def index
  end

  def new
    @job = @project.jobs.build
  end

  def create
    @job = @project.jobs.build(job_params)

    if @job.save
      flash[:notice] = "Job created"
      redirect_to project_job_path(@project, @job)
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

    def job_params
      params.require(:job).permit!
    end

    def set_job
      set_project
      @job = Job.find params[:id]
    end

    def set_project
      @project = Project.find_by slug: params[:project_id]
    end

end