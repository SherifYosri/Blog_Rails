module Posts
  class Updater
  	def initialize(post)
  		@post = post
  	end

  	def update(post_attributes)
  		@post.update!(post_attributes)

  		@post
  	end
  end
end