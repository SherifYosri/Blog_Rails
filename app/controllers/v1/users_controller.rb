require 'users/creator.rb'
require 'files_helper'

module V1
	class UsersController < Devise::RegistrationsController
	  include ::Users::Creator
	  include FilesHelper
	  
	  before_action :permit_signup_params, only: :create

	  def create
	  	user = create_user
	  	attach_user_image(user) if sign_up_params[:image].present?
	  	
	  	render json: user, status: :created
	  end

	  private
	    def permit_signup_params
	    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
	    end

	    def attach_user_image(user)
	    	user_image_name = "#{sign_up_params[:email]}_image"
		  	user_image = base64_to_file(sign_up_params[:image], user_image_name)
		  	user.image.attach(io: user_image, filename: user_image_name)
		  	user_image.close
		  	user_image.unlink
	    end

	    def user_creation_params
	    	sign_up_params.except(:image)
	    end
	end
end