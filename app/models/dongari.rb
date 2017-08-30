class Dongari < ApplicationRecord
    
    belongs_to :user
    belongs_to :mozipp
    
    has_many :dongarireplies, dependent: :destroy
    
    mount_uploaders :image, ImagesUploader
    serialize :image, JSON
    
end
