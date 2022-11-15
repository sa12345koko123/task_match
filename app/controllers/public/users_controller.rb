class Public::UsersController < ApplicationController

  def show
    @user = current_user
    # @user_orders = current_user.orders.where("start_time >= ?", DateTime.current).order(day: :desc)
  end

  def update
    @user = current_user
	  if @user.update(user_params)
		   redirect_to  users_my_page_path(current_user)
	  else
			render :edit
	  end

  end

  def edit
    @user = current_user
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(user_status: false)
    reset_session
    redirect_to root_path
  end

  private
	def user_params
	  params.require(:user).permit(:email,:name_family, :name_first, :name_family_kana, :name_first_kana, :handle_name, :profile, :phone_number, :address, :postal_code, :user_status)
	end


end
