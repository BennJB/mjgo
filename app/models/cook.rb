class Cook < ApplicationRecord
    
    belongs_to :user
    has_many :cookreplies, dependent: :destroy
    has_many :cookevents, dependent: :destroy
    
    
    mount_uploaders :image, ImagesUploader
    serialize :image, JSON
    
    belongs_to :cookchoice
    belongs_to :cooklist
    
end
