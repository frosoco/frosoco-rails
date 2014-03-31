class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      # Users can make posts
      t.belongs_to :user

      # The content of the post
      t.text :content

      # Timestamps for the post
      t.timestamps

    end
  end
end
