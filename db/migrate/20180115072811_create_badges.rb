class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :file_name
      t.string :rule_title
      t.string :rule_value

      t.timestamps
    end
  end
end
