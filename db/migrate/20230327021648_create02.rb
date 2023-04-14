class Create02 < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :note
      t.string :opinion
      t.boolean :watched


      t.timestamps
    end
  end
end
