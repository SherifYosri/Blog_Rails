class Tag < ApplicationRecord
  
  #-Validations-----
    validates :body, presence: true
  #-----
end
