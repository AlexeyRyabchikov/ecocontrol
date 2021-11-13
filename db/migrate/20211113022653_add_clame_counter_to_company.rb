class AddClameCounterToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :clame_counter, :integer, default: 0
  end
end
