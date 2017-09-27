class Cookreply < ApplicationRecord
    
    belongs_to :cook
    belongs_to :user
    
    mount_uploader :image, ImagesUploader

end
