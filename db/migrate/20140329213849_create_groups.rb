class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      # Full name (ie FroSoCo 2013-14)
      t.string :name

      # Identifier (ie fsc-2013-14)
      t.string :identifier

      # Description
      t.text :description

      # Timestamps associated
      t.timestamps

    end
  end
end
