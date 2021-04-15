module V1
	class PostsController < ApplicationController
	  before_action only: [:update, :destroy] do
	  	load_post params[:id]
	  end

	  def create
	  	permitted_params = params.permit(:body, :title, tags: [])
	  	post = post_creator.create(permitted_params)
	    render json: post, status: :created
	  end

	  def update
	  	authorize! :update, @post
	  	permitted_params = params.permit(:body, :title)
	  	post_updater.update(permitted_params)
	  end

	  def destroy
	  	authorize! :destroy, @post
	  	@post.destroy!
	  end

	  private

	  def post_creator
	  	require 'posts/creator.rb'
	  	@post_creator ||= ::Posts::Creator.new(current_user)
	  end

	  def post_updater
	  	require 'posts/updater.rb'
	  	@post_updater ||= ::Posts::Updater.new(@post)
	  end

	end
end