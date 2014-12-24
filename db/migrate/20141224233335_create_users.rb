class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :nickname, null: false
      t.string :gravatar_id
      t.string :token
      t.string :email

      t.timestamps
    end

    add_index :users, :nickname, unique: true
  end
end
