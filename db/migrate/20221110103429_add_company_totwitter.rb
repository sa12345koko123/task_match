class AddCompanyTotwitter < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :company_name, :string, default: "", null: false
    change_column :companies, :address, :string, default: "", null: false
    change_column :companies, :phone_number, :string, default: "", null: false
    change_column :companies, :home_page, :string, default: "", null: false

  end
end
