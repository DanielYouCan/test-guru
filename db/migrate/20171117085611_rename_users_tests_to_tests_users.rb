class RenameUsersTestsToTestsUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index :users_tests, :test_id
    remove_index :users_tests, :user_id
    rename_table :users_tests, :tests_users
    add_index :tests_users, :test_id
    add_index :tests_users, :user_id
  end
end
