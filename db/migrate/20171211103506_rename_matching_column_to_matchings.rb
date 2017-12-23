class RenameMatchingColumnToMatchings < ActiveRecord::Migration[5.0]
  def change
    rename_column :matchings, :matching, :matching_status
  end
end
