class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :time
      t.string :price

      t.references :meal, :user, foreign_key: true

      t.timestamps
    end
  end
end
