class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:questions, :body, false)
  end
end
