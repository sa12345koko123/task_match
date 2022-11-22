class Companies::CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @jobs = Job.where(company_id: @company.id)
    @orders = Order.all

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
    params.require(:company).permit(:email, :company_name, :address, :phone_number, :home_page, :overview)
  end


end
