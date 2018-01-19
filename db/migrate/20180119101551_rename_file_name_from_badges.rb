class RenameFileNameFromBadges < ActiveRecord::Migration[5.1]
  def change
    rename_column :badges, :file_name, :image_file_name
  end
end
