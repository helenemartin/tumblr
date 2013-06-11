class Post < ActiveRecord::Base
  attr_accessible :image_extension, :post_type, :tags, :title, :image

  IMAGE_STORE = "#{Rails.root}/public/image_store"

  after_save :store_image

  def image_filename
  	return "#{IMAGE_STORE}/#{id}.#{image_extension}"
  end

  def store_image
  	if @file_data
  		# create directory IMAGES_STORE if it doesn't exist
  		FileUtils.mkdir_p IMAGE_STORE

  		# save the image to a file location

  		File.open(image_filename, "wb") do |f|
  			f.write(@file_data)

  		end

  		#make sure it doesn't resave
  		@file_data = nil

  	end
  end

  def image=(file_data)
  	unless file_data.blank?

  		# assign uploaded data to instance variable
  		@file_data = file_data.read

  		

  		e = file_data.original_filename.split(".").last.downcase

  		self.image_extension = e
  	end

  end

  def image_url
  	"/image_store/#{image_extension}"
  end

  def image?
  	return File.exists?(image_filename)
  end
end

