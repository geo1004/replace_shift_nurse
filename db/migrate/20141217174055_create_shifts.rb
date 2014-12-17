class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :user
      t.string :title
      t.string :content
      t.datetime :start_date
      t.datetime :end_date
      t.string :slot_type

      t.timestamps null: false
    end
  end
end
