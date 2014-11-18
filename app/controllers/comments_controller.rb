class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_project
  before_action :require_admin, only: [:destroy]
  
  def create
    @comment = current_user.comments.build params.require(:comment).permit(:body)
    @comment.project = @project
    @comment.save

    respond_to do |format|
      format.html do
        if @comment.valid?
          flash[:success] = "Successfully added a comment."
        else
          flash[:danger] = "Body can't be blank."
        end
        redirect_to :back
      end
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to project_url(@project), success: "Comment destroyed" }
      format.js
    end
  end

  private

  def set_project
    @project = Project.find_by slug: params[:project_id]
  end

end