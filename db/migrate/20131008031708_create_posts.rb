class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |g|
      g.string :title
      g.text :description
    end
  end

  def down
    drop_table :posts
  end
end
