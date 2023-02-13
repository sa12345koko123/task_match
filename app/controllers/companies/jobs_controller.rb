class Companies::JobsController < ApplicationController


  def new
    @job = Job.new
    @company = Company.find(params[:company_id])
  end

  def create
    @job = Job.new(job_params)

    @job.company_id = current_companies_company.id
    tag_list = params[:job][:tag_name].split(',')
    if @job.save
      @job.save_tag(tag_list)
      flash[:notice] = '仕事を追加しました'
      redirect_to companies_company_jobs_path
    else
      @company = Company.find(params[:company_id])
      # @Jobs = Job.all
      render :new
    end
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @tag_list = Tag.all


  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comments = @job.comments
    @job_tags = @job.tags
    @orders = @job.orders
  end

  def edit
     @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    tag_list = params[:job][:tag_name].split(',')

    if @job.update(job_params)
    # if params[:job][:job_status]== "受付中"
  # このjob_idに紐づいていたタグを@oldに入れる
      @old_relations=JobTag.where(job_id: @job.id)
  # それらを取り出し、消す。消し終わる
      @old_relations.each do |relation|
      relation.delete
      end
       @job.save_tag(tag_list)

      flash[:notice] = '仕事を更新しました'
      @company =Company.find(params[:company_id])
      redirect_to companies_company_job_path(@company)
    else
      @company =Company.find(params[:company_id])
      render :edit
    # end
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    @company =Company.find(params[:company_id])
    redirect_to companies_company_jobs_path(@company)
  end


  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @company = Company.find_by(params[:company_id])
    @jobs = @tag.jobs.all
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :unit_price, :job_status, :company_id)
  end

end
