class AddFkToComments < ActiveRecord::Migration[7.0]
  def change
    def change
      add_reference :comments, :movie, foreign_key: true
    end
  end
end
