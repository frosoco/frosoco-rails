class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.datetime :start
      t.datetime :end
      t.integer :capacity
      t.timestamps
    end
  end
end
