class PostFormBuilder < ActionView::Helpers::FormBuilder

	def post_select(method, options={}, html_options={})
		post_types = []
		post_types << ["Image", "image"]
		post_types << ["Text", "text"]
		post_types << ["Quote", "quote"]

		select(method, post_types, options, html_options)

	end

	def label(method, options={}, html_options={})

		html_to_add = ""

		if options[:required] == true
			html_to_add << "<span class='required'>*</span>"
		end

		super(method, options) + html_to_add.html_safe

	end

end
