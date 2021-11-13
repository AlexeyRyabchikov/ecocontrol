class AddCompaniesLocation < ActiveRecord::Migration[6.1]
  def change
    change_table :companies do |t|
      t.decimal :longitude, precision: 15, scale: 10
      t.decimal :latitude, precision: 15, scale: 10
    end
  end
end
