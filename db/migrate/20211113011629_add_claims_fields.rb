class AddClaimsFields < ActiveRecord::Migration[6.1]
  def change
    change_table :claims do |t|
      t.string :fio
      t.string :reason
      t.string :symptoms
      t.string :location
      t.string :state
    end
  end
end
