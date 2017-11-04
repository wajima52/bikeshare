class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.string :place
      t.string :content

      t.timestamps
    end
  end
end
