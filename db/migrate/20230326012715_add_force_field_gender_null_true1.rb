class AddForceFieldGenderNullTrue1 < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :gender, :string, null: false
  end
end
