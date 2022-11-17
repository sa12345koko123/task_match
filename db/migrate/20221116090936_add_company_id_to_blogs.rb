class AddCompanyIdToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :company_id, :integer
  end
end
