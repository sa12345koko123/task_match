class Admins::CompaniesController < ApplicationController

  def index
    @companies = Company.all
    # @jobs = Job.all
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.password = SecureRandom.alphanumeric(6)
    if @company.save
      flash.now[:success] = "店舗を登録しました。初期パスワードは#{ @company.password }です"
      redirect_to admins_companies_path
    else
      @companies = Company.all
      # @jobs = Job.all
      render :index
    end
  end


  private
  def company_params
    params.require(:company).permit(:email, :company_name, :address, :phone_number, :home_page)
  end

end
