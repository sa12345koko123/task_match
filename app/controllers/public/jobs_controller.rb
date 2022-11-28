class Public::JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

# このアクションが実行されるとPV数カウントされる
  impressionist :actions => [:show]

  def index
    @jobs = Job.all
    @tag_list = Tag.all
  end

  def show
    @job = Job.find(params[:id])
    @order = Order.new
    @comment = Comment.new
    @comments = @job.comments
    @job_tags = @job.tags
    # 新規登録した1人に対象
     impressionist(@job, nil, unique: [:session_hash.to_s])
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @jobs = @tag.jobs.all
  end




   private
  def job_params
    params.require(:job).permit(:title, :description, :unit_price, :job_status, :company_id)
  end

end
