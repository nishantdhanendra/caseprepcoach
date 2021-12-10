class CreateCaseRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :case_repositories do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
