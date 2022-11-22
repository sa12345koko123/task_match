class Public::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @jobs = Job.where(company_id: @company.id)
  end

  private
  def company_params
    params.require(:company).permit(:company_image, :email, :company_name, :address, :phone_number, :home_page, :overview)
  end
end
