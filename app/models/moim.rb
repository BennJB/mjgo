class Moim < ApplicationRecord
    
    belongs_to :user
    belongs_to :mozip
    belongs_to :moimcategory
    
    has_many :moimreplies, dependent: :destroy
    
    mount_uploaders :image, ImagesUploader
    serialize :image, JSON
    
end
