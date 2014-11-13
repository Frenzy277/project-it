class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @job = Job.find(params[:job_id])
    @project = @job.project
    @comment = current_user.comments.build params.require(:comment).permit(:body)
    @comment.job = @job

    if @comment.save
      flash[:notice] = "Successfully added a comment."
      redirect_to :back
    else
      render 'projects/management'
    end
  end

end