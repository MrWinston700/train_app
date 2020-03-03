class CreateTrainRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :train_routes do |t|
      t.integer :user_id
      t.integer :train_id
      t.string :destination
      t.string :departing
      
      t.timestamps
    end
  end
end
