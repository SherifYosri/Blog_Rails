class Post < ApplicationRecord
  #-Associations-----
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
  #-----

  #-Validations-----
    validates :title, :body, :post_tags, presence: true
  #-----

  #-Callbacks-----
    after_create :enqueue_posts_clean_job
  #-----

  def enqueue_posts_clean_job
  	PostsCleanJob.set(wait: 24.hours).perform_later(self.id)
  end
end
