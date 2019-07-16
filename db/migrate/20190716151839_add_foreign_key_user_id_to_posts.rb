class AddForeignKeyUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :integer
    add_foreign_key :posts, :users
  end
end
