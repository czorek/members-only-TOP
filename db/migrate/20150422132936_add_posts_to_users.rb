class AddPostsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :posts, index: true
    add_foreign_key :users, :posts
  end
end
