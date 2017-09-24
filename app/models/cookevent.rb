class Cookevent < ApplicationRecord
    
    belongs_to :cook
    belongs_to :user
    
    mount_uploader :image, ImagesUploader
   
end
