require_relative '../../app/services/cloudinary_service.rb'
client = CloudinaryService.instance

client.upload_image("https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg", "olympic_flag")

transformed_url = client.transform_image("olympic_flag", width: 100, height: 150, crop: "fill")
