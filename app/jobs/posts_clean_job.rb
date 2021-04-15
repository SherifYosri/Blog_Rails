class PostsCleanJob < ApplicationJob
	queue_as :medium

	def	perform(id)
	  post = Post.find(id)
	  post.destroy!
	end
end