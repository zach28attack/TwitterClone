class ImageUploader < Shrine
  require "image_processing/mini_magick"

  # This file resizes any image as it is uploaded and saves the altered
  # image as a new image derivative
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    { 
      large:  magick.resize_to_limit!(300, 300),
      small:  magick.resize_to_limit!(50, 50),
    }
  end
end