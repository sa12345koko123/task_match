class Companies::CompaniesController < ApplicationController
  # before_action :authenticate_companies_company!, except: [:index]

  def show
    @company = Company.find(params[:id])
    @jobs = Job.where(company_id: @company.id)
    # whereでorderに絞り込み会社に紐ずくjob.idをもってくる
    @orders = Order.where(job_id: @company.jobs.ids)
    # @orders = Order.all

    # @orders = @user.orders
    # @orders = @job.orders

  end


  def edit
    @company = Company.find(params[:id])
  end


  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = '会社情報を更新しました'
      redirect_to companies_company_path(@company.id)
    else
      render :edit
    end
  end

  def guest_sign_in
    # binding.pry
    company = Company.guest
    sign_in company
    redirect_to companies_company_path(company), notice: 'guestcompanyでログインしました。'
  end




  private
  def company_params
    params.require(:company).permit(:company_image, :email, :company_name, :address, :phone_number, :home_page, :overview)
  end


end
