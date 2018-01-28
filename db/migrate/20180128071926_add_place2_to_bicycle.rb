class AddPlace2ToBicycle < ActiveRecord::Migration[5.0]
  def change
    add_column :bicycles, :place2, :string
  end
end
