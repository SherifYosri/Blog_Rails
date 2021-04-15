module Posts
  class Creator
  	def initialize(author)
  		@author = author
  	end

  	def create(post_attributes)
  		post_attributes[:user] = @author
  		post = Post.new(post_attributes.except(:tags))
  		
  		ActiveRecord::Base.transaction do
	  		post = build_post_tags(post, post_attributes[:tags])
	  		post.save!
  		end

  		post
  	end

  	def build_post_tags(post, tags_bodies)
  		require 'posts/tags_creator.rb'
  		Posts::TagsCreator.new(post).build_post_tags(tags_bodies)
  	end
  end
end