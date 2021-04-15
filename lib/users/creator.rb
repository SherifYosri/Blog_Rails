module Users
  module Creator
    def create_user
      resource = build_resource(user_creation_params)
      resource.save!
      sign_up(resource_name, resource)

      resource
    end
  end
end