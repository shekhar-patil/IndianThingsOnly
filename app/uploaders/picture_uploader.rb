class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end
end
