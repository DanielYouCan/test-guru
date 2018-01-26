class AddDurationAttributeToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :duration, :time
  end
end
