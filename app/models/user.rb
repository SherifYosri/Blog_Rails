class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_one_attached :image

  #-Validations-----
    validates :name, presence: true
  #-----
end
