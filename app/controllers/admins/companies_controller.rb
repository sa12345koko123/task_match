class Admins::CompaniesController < ApplicationController

  def index
    @companies = Company.all
    @jobs = Job.all
  end


  private
  def company_params
    params.require(:company).permit(:email, :company_name, :address, :phone_number, :home_page)
  end

end
