class RemovePhoneNumbertFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :phone_numbert, :string
  end
end
