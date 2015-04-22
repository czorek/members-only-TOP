class AddTitleTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :string
  end
end
