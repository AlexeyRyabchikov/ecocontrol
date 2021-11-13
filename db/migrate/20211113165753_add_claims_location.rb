class AddClaimsLocation < ActiveRecord::Migration[6.1]
  def change
    change_table :claims do |t|
      t.decimal :longitude, precision: 15, scale: 10
      t.decimal :latitude, precision: 15, scale: 10
    end
  end
end
