class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true
      t.string :gist_url

      t.timestamps
    end
  end
end
