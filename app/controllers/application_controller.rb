class ApplicationController < ActionController::Base

  def current_company?
    unless admins_admin_signed_in?
      unless (params[:company_id] || params[:id]) == current_companyt.id.to_s
        redirect_to company_path(current_company)
      end
    end
  end


  def current_job?
    unless job.find_by(id: params[:id], company_params_id: current_company.id)
      redirect_to companies_company_jobs_path(current_company)
    end
  end

  def set_current_company
    @current_company = current_company
    # @current_company = Company.find_by(id: session[:company_id])
  end

end
