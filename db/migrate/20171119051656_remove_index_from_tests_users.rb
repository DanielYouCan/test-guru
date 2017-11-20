class RemoveIndexFromTestsUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index :tests_users, [:test_id, :user_id]
    add_index :tests_users, [:test_id, :user_id]
  end
end
