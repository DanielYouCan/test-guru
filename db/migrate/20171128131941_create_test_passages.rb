class CreateTestPassages < ActiveRecord::Migration[5.1]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.integer :current_question_id
      t.integer :correct_questions, default: 0

      t.timestamps
    end

    add_foreign_key :test_passages, :questions, column: :current_question_id 
  end
end
