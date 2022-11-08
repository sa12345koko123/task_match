class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|

      t.integer :company_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :unit_price, null: false
      t.boolean :job_status, default: true




      t.timestamps
    end
  end
end
