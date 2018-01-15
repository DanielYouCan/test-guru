class AddNullConstraintsToFeedback < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:feedbacks, :title, false)
    change_column_null(:feedbacks, :body, false)
  end
end
