class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|

      # We associate activities with groups that they take place in
      t.belongs_to :group

      # Identifiers to help us locate the actual content
      t.string :content_type
      t.string :content_id

      t.timestamps

    end

  end
end
