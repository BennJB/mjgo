class Image < ApplicationRecord
    
   mount_uploader :file, ImagesUploader

end
