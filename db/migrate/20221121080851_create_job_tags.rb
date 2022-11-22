class CreateJobTags < ActiveRecord::Migration[6.1]
  def change
    create_table :job_tags do |t|

      t.integer :job_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
