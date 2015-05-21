class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.time :start
      t.time :end
      t.integer :table

      t.timestamps null: false
    end
  end
end
