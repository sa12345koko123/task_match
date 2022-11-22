class Admins::CompaniesController < ApplicationController

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
    params.require(:company).permit(:email, :company_name, :address, :phone_number, :home_page)
  end

end
