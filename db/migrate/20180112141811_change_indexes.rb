class ChangeIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :test_passages, :test_id
    remove_index :test_passages, :user_id
    remove_index :gists, :question_id
    remove_index :gists, :user_id
    add_index :test_passages, [:test_id, :user_id]
    add_index :gists, [:question_id, :user_id]
  end
end
