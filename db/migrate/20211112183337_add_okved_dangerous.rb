class AddOkvedDangerous < ActiveRecord::Migration[6.1]
  def change
    add_column :okveds, :dangerous, :boolean, default: :false
  end
end
