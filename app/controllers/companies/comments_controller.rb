class Companies::CommentsController < ApplicationController


  def create
    @job = Job.find(params[:job_id])
    @comment = current_companies_company.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:comment_content, :job_id)
  end
end
