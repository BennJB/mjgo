class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :conversations_started, class_name: "Conversation", foreign_key: :sender_id
  has_many :conversations_continued, class_name: "Conversation", foreign_key: :recipient_id
  
  def conversations
      conversations_started + conversations_continued
  end
  # has_many :conversations, foreign_key: :sender_id
  
  # validates_length_of :password, minimum: 6, message: "비밀번호가 짧아요..6자리 이상!"
  # validates_confirmation_of :password, message: "비밀번호가 일치하지 않아요."
  # 비밀번호 변경 url에서 이 유효성 검사 때문에, 현재 비밀번호만 입력해도 수정되지 않아서 지워줌. 
  
  validates_presence_of :email, message: "이메일을 입력해주세요."
  validates_presence_of :nic_name, message: "닉네임을 입력해주세요."
  
  validates_uniqueness_of :email, message: "동일한 이메일이 이미 존재합니다."
  validates_uniqueness_of :nic_name, message: "동일한 닉네임이 이미 존재합니다."
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
  has_many :posts    
  has_many :replies  
  has_many :moimreplies  
  has_many :dongarireplies  
  
  has_many :moims
  has_many :dongaris
  
  # 좋아요 관계 설정
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  def is_like?(post)   # 특정 게시글(post_id)을 그 사용자(user_id)가 좋아요 했는지, 안했는지 true/false 값을 리턴
    Like.find_by(user_id: self.id, post_id: post.id).present?
    # is_like? 메소드는 뷰 화면에서 '좋아요 취소' & '좋아요' 리턴 판별만 하는데 의미가 있다.
    # false면, '좋아요'를 보여주는 것(눌렀을 때의 db 생성은 라우트로 이동시켜서 컨트롤러에서 진행! )
    # self는 아직 정확하게 모르겠음...self를 current_user로 바꾸거나 하면 오류 뜸!
  end
  
 def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.nic_name = "f_#{auth.info.name}"   # 기존 회원의 nic_name과 겹치면 가입 안되는거 방지.
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.facebook_name = data["name"] if user.name.blank?
      end
    end
  end
  
end
