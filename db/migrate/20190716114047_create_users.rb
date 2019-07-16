class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :encrypted_email
      t.string :encrypted_password

      t.timestamps
    end
    add_index :users, :encrypted_email, unique: true
  end
end
