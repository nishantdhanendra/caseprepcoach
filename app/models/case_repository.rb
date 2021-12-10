class CaseRepository < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, uniqueness: true

  validates :user_id, presence: true

  # Scopes

  def to_s
    user_id
  end
end
