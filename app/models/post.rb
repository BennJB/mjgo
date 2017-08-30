class Post < ApplicationRecord
    
    belongs_to :user
    has_many :replies, dependent: :destroy
    
    # 좋아요 관계 설정
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    mount_uploaders :image, ImagesUploader
    serialize :image, JSON
    
    belongs_to :category
    belongs_to :selling
end
