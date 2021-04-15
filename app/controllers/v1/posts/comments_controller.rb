module V1
	module Posts
		class CommentsController < ApplicationController
	    before_action :load_comment, only: [:update, :destroy]

		  def create
		  	comment = comment_creator.create(params[:body])
		    render json: comment, status: :created
		  end

		  def update
	  	  authorize! :update, @comment
		  	permitted_params = params.permit(:body)
	  		comment_updater.update(permitted_params)
		  end

		  def destroy
		  	authorize! :destroy, @comment
	  		@comment.destroy!
		  end

		  private

		  def load_comment
		  	@comment = Comment.find(params[:id])
		  end

		  def comment_creator
		  	require 'comments/creator.rb'
		  	@comment_creator ||= ::Comments::Creator.new(get_post!, current_user)
		  end

		  def comment_updater
		  	require 'comments/updater.rb'
	  		@comment_updater ||= ::Comments::Updater.new(@comment)
		  end

		  def get_post!
		  	Post.find(params[:post_id])
		  end
		end
	end
end