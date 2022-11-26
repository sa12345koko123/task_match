class Admins::UsersController < ApplicationController
   before_action :authenticate_admins_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(user_status: false)
    reset_session
    redirect_to admins_users_path
  end

   private
	def user_params
	  params.require(:user).permit(:profile_imge, :email,:name_family, :name_first, :name_family_kana, :name_first_kana, :handle_name, :profile, :phone_number, :address, :postal_code, :user_status)
	end

end
