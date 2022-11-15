class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :user_id, null: :false
      t.integer :job_id, null: :false
      t.date :day, null: :false
      t.string :time, null: :false
      t.datetime :start_time, null: :false

      t.timestamps
    end
  end
end
