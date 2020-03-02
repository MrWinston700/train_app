class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :identification_number
      t.string :model
      t.integer :max_pax
      t.boolean :operating, default: true
      t.timestamps
    end
  end
end
