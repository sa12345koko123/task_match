class ApplicationController < ActionController::Base

  before_action :configure_user_permitted_parameters, if: :devise_controller?

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

  def configure_user_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family, :name_first, :name_family_kana, :name_first_kana, :phone_number])
  end


end
