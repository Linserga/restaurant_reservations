class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :table_number

      t.timestamps null: false
    end
  end
end
