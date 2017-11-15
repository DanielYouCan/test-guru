class AddAnswersBodyNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :body, false)
  end
end
