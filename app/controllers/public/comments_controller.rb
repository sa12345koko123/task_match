class Public::CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @job_new = Job.new
      @comments = @job.comments
      redirect_to
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :job_id)
  end
end
