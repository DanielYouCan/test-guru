class AddPassedAttributeToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :passed, :boolean
  end
end
