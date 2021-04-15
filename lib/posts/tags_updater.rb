module Posts
  class TagsUpdater
  	def initialize(post)
  		@post = post
  	end

    def update(tags_bodies)
      ActiveRecord::Base.transaction do
        @post.post_tags.destroy_all
        @post = build_post_tags(tags_bodies)
        @post.save!

        @post
      end
    end

    def build_post_tags(tags_bodies)
      require 'posts/tags_creator.rb'
      ::Posts::TagsCreator.new(@post).build_post_tags(tags_bodies)
    end
  end
end