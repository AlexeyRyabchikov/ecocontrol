class AddNvosToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :nvos_checked, :boolean, default: :false
  end
end
