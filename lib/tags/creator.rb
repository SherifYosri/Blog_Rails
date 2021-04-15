module Tags
	class Creator
		def initialize(tag_attrs)
			@tag_attrs = tag_attrs
		end

		def create
			tag = build
			tag.save!

			tag
		end

		def build
			Tag.new({body: @tag_attrs[:body]})
		end

		def find_or_create
			tag_record = Tag.find_by_body(@tag_attrs[:body])
			tag_record.present? ? tag_record : create
		end
	end
end