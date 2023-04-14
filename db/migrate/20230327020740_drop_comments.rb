class DropComments < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :describe
      t.string :gender, null:false

      t.timestamps
    end
  end
end
