class Admins::CompaniesController < ApplicationController
  before_action :authenticate_admins_admin!

  def index
    @companies = Company.all
    @jobs = Job.all
  end

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
  end


  private
  def company_params
    params.require(:company).permit(:company_image, :email, :company_name, :address, :phone_number, :home_page)
  end

end
