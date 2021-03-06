class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :interest, array: true
      t.text :description
      t.boolean :host, :default => false

      t.timestamps
    end
  end
end
