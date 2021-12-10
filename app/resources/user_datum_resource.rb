class UserDatumResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :user_name, :string
  attribute :user_goal, :string
  attribute :self_assessment_score, :integer
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  # Indirect associations
end
