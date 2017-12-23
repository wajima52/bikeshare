class CreateMatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :matchings do |t|
     
      t.references :renter, foreign_key: {to_table: :users}
      t.references :borrower, foreign_key: {to_table: :users }
      t.references :bicycle, foreign_key: true
      t.integer :matching, default: 0
      
      t.timestamps
      
      t.index [:renter_id, :borrower_id], unique: true
    end
  end
end
