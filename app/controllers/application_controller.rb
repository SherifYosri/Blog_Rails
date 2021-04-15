class ApplicationController < ActionController::API
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    render json: "Access Denied", status: :forbidden
  end

  def load_post(post_id)
	  @post = Post.find(post_id)
	end
end
