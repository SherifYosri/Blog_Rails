module Comments
  class Updater
  	def initialize(comment)
  		@comment = comment
  	end

  	def update(comment_attributes)
  		@comment.update!(comment_attributes)

  		@comment
  	end
  end
end