class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :rental_bicycle, foreign_key: { to_table: :bicycles }

      t.timestamps
      
      t.index [:user_id, :rental_bicycle_id], unique: true
    end
  end
end
