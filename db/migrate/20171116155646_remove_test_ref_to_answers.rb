class RemoveTestRefToAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :answers, :test, foreign_key: true, index: true
  end
end
