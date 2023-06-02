require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'
require 'dot_env'
require 'singleton'

class CloudinaryService
  include Singleton

  current_environment = DotEnv.get_environment

  def initialize
    Cloudinary.config do |config|
      config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
      config.api_key = ENV['CLOUDINARY_API_KEY']
      config.api_secret = ENV['CLOUDINARY_API_SECRET']
      config.secure = true
    end
  end

  def upload_image(url, public_id)
    Cloudinary::Uploader.upload(url, public_id: public_id)
  end

  def transform_image(public_id, options = {})
    Cloudinary::Utils.cloudinary_url(public_id, options)
  end
end
