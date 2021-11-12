class AddOkvedToCompany < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :okved, index: true
    add_column :companies, :activity_type, :string
  end
end
