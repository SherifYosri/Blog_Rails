module V1
	module Posts
		class TagsController < ApplicationController
	    before_action only: [:update] do
	  	  load_post params[:post_id]
	    end

		  def update
		  	authorize! :update, @post
		  	permitted_params = params.permit(tags: [])
		  	tags_updater.update(permitted_params[:tags])
		  end

		  private

		  def tags_updater
		  	require 'posts/tags_updater.rb'
		  	::Posts::TagsUpdater.new(@post)
		  end
    end
  end
end