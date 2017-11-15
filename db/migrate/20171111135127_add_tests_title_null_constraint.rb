class AddTestsTitleNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:tests, :title, false)
  end
  
  # def up
  #   change_column_null(:tests, :title, false)
  # end

  # def down
  #   change_column_null(:tests, :title, true)
  # end
end
