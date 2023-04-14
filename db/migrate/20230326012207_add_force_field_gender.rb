class AddForceFieldGender < ActiveRecord::Migration[7.0]
  def up
    change_table :movies do |m|
      m.change :gender, :string, null: true
    end
  end

  def down
    change_table :movies do |m|
      m.change :gender, :string
    end
  end
end
