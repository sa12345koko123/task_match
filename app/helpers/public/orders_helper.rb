module Public::OrdersHelper

  def times
    times = ["9:00",
             "9:30",
             "10:00",
             "10:30",
             "11:00",
             "11:30",
             "13:00",
             "13:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30",
             "17:00"]
  end


  def check_order(orders, day, time, job_id)
    result = false
    orders_count = orders.count

    # 取得した予約データにdayとtimeとjob_idがが一致する場合はtrue,一致しない場合はfalseを返します
    if orders_count >= 1
      orders.each do |order|
        result = order[:day].eql?(day) && order[:time].eql?(time) && order[:job_id].eql?(job_id[:job_id])
        return result if result
      end

   

    # elsif orders_count == 1
    #   result = orders[0][:day].eql?(day.strftime("%Y-%m-%d")) && orders[0][:time].eql?(time)
    #   return result if result
    
    
    end
    return result
  end





end
