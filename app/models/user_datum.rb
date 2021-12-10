class UserDatum < ApplicationRecord
  
  include JwtToken
# Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:user_name] }

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user_id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
