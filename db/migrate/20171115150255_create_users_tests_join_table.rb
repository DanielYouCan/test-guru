class CreateUsersTestsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tests, id: false do |t|
      t.integer :test_id
      t.integer :user_id
    end

    add_index :users_tests, :test_id
    add_index :users_tests, :user_id
  end
end
