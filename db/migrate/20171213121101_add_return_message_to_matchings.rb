class AddReturnMessageToMatchings < ActiveRecord::Migration[5.0]
  def change
    add_column :matchings, :return_message, :string
  end
end
