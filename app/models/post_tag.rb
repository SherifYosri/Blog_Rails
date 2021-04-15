class PostTag < ApplicationRecord
  #-Associations-----
    belongs_to :post
    belongs_to :tag
  #-----
end
