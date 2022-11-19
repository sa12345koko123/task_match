class Order < ApplicationRecord

  belongs_to :user
  belongs_to :job

  def self.orders_after_three_month
    # 今日から3ヶ月先までのデータを取得
    orders = Order.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
    order_data = []
    orders.each do |order|
      orders_hash = {}
      orders_hash.merge!(day: order.day.strftime("%Y-%m-%d"), time: order.time)
      order_data.push(reservations_hash)
    end
    order_data
  end
end