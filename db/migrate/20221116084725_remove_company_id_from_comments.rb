class RemoveCompanyIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :company_id, :integer
  end
end
