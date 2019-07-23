class AddColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
    # add_foreign_key :posts, :users
  end
end
