class Companies::JobsController < ApplicationController


  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # binding.pry
    @job.company_id = current_companies_company.id
    if @job.save
      flash[:notice] = '仕事を追加しました'
      redirect_to companies_company_jobs_path
    else
      @Jobs = Job.all
      render :new
    end
  end

  def index
    # logger.debug '=============================================================='
    # logger.debug params[:id].inspect
    # logger.debug params[:company_id]
    # logger.debug '=============================================================='
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def edit
     @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = '仕事を更新しました'
      @company =Company.find(params[:company_id])
      redirect_to companies_company_job_path(@company)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    @company =Company.find(params[:company_id])
    redirect_to companies_company_jobs_path(@company)
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :unit_price, :job_status, :company_id)
  end

end
