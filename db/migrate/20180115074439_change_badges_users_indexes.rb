class ChangeBadgesUsersIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :badges_users, :badge_id
    remove_index :badges_users, :user_id
  end
end
