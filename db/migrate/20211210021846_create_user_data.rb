class CreateUserData < ActiveRecord::Migration[6.0]
  def change
    create_table :user_data do |t|
      t.integer :user_id
      t.string :user_name
      t.string :user_goal
      t.integer :self_assessment_score

      t.timestamps
    end
  end
end
