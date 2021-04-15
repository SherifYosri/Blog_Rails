module Comments
  class Creator
  	def initialize(post, author)
  		@post = post
  		@author = author
  	end

  	def create(comment_body)
  		Comment.create!({ post: @post, user: @author, body: comment_body })
  	end
  end
end