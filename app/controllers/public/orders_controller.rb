class Public::OrdersController < ApplicationController

  def index
    @job = Job.find(params[:job_id])
    # byebug
    @orders = Order.all
    #@orders = Order.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    @order = Order.new
    # byebug
    @job = Job.find(params[:job])
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end


  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @job = Job.find(params[:job])
    @order.job_id = @job.id
    if @order.save!
      # byebug
      redirect_to user_order_path(current_user.id, @order.id)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @job = @order.job
    # byebug
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      # byebug
      redirect_to request.referer, flash: { success: "予約を削除しました" }
    else
      render :show, flash: { error: "予約の削除に失敗しました" }
    end
  end


  private
  def order_params
    params.require(:order).permit(:user_id, :job_id, :day, :time, :start_time)
  end
end
