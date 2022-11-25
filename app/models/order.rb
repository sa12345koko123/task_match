class Order < ApplicationRecord

  belongs_to :user
  belongs_to :job

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } #今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } #前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前

  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } #前週
  scope :created_this_month, -> { where(created_at: 1.month.ago.beginning_of_day..Time.zone.now.end_of_day) } #今月
  scope :created_last_month, -> { where(created_at: 2.month.ago.beginning_of_day..1.month.ago.end_of_day) } #前月






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
