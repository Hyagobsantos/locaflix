class Drop01 < ActiveRecord::Migration[7.0]
  def change
    drop_table :movies
  end
end
