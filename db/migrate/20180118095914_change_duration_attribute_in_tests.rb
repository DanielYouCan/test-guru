class ChangeDurationAttributeInTests < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :duration
    add_column :tests, :duration, :integer
  end
end
