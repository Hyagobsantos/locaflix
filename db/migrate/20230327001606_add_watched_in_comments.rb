class AddWatchedInComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :watched, :boolean
  end
end
