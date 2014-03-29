class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.string :content_type
      t.string :content_id
      t.timestamps
    end
  end
end
