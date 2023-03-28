class AddFieldsForActiveJob < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :img, :string
    add_column :movies, :year, :integer
  end
end
