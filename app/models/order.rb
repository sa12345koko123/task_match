class Order < ApplicationRecord

  belongs_to :user
  belongs_to :job
  
  




  # validate :date_before_start
  # validate :date_current_today
  # validate :date_three_month_end



  def self.orders_after_three_month
    # 今日から3ヶ月先までのデータを取得
    orders = Order.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
    order_data = []
    orders.each do |order|
      orders_hash = {}
      orders_hash.merge!(day: order.day.strftime("%Y-%m-%d"), time: order.time)
      order_data.push(orders_hash)
    end
    order_data
  end


  # def date_before_start
  #   errors.add(:day, "は過去の日付は選択できません") if day < Date.current
  # end

  # def date_current_today
  #   errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  # end

  # def date_three_month_end
  #   errors.add(:day, "は3ヶ月以降の日付は選択できません") if (Date.current >> 3) < day
  # end

end
