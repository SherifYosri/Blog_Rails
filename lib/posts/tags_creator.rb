module Posts
  class TagsCreator
  	def initialize(post)
  		@post = post
  	end

    def build_post_tags(tags_bodies)
  		tags_bodies = Array.wrap(tags_bodies)
  		tags_bodies.each{ |tag_body|
  			tag = find_or_create_tag(tag_body)
  			@post.post_tags.build({ tag: tag})
  		}
  		@post
  	end

  	def find_or_create_tag(tag)
  		require 'tags/creator.rb'
  		::Tags::Creator.new({ body: tag }).find_or_create
  	end
  end
end