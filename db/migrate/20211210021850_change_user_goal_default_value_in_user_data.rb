class ChangeUserGoalDefaultValueInUserData < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_data, :user_goal, "Consulting"
  end
end
