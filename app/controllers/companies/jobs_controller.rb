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
    logger.debug '=============================================================='
    logger.debug params[:id].inspect
    logger.debug params[:company_id]
    logger.debug '=============================================================='
    @company = Company.find(params[:company_id])
    # @jobs = Job.all
    @jobs = @company.jobs
  end

  def show
    @job = Job.find(params[:id])
    # @job = @companiy.job
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = '仕事を更新しました'
      redirect_to company_job_path(@job.id)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to company_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :unit_price, :job_status, :company_id)
  end

end
