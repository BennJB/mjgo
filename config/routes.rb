Rails.application.routes.draw do
  
  # 전체 게시판
  root 'dongari#dongari'
  
  mount ActionCable.server => '/cable'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
                                       
  resources :conversations do
    resources :messages
  end
  
  get '/index' => 'home#index'
  
  # 페이스북 가입 시, 이메일 없으면 경고 경로 
  get '/no_email' => 'home#no_email'
 
  # category 기타
  get '/etc' => 'home#etc'
  
  # 게시판 글쓰기
  get '/new' => 'home#new'
  get '/item_new' => 'home#item_new'
  post '/create' => 'home#create'
  
  # 해당 게시글 보여주기 & 삭제
  get '/show/:id' => 'home#show'
  post '/destroy/:id' => 'home#destroy'
  
  # 게시글 수정하기
  get '/update/:id' => 'home#update'
  get '/item_update/:id' => 'home#item_update'
  patch '/update_new/:id' => 'home#update_new'
  
  # 댓글 작성하기 & 삭제하기
  post '/reply/:id' => 'home#reply'
  post '/destroy2/:post_id/:reply_id' => 'home#destroy2'
  
  # 모임
  get '/moim' => 'moim#friend'
  
  # 모임 글쓰기
  get '/moim_new' => 'moim#moim_new'
  post '/moim_create' => 'moim#moim_create'
  
  # 해당 모임 보여주기 & 삭제
  get '/moim_show/:id' => 'moim#moim_show'
  post '/moim_destroy/:id' => 'moim#moim_destroy'
  
  # 모임 수정하기
  get '/moim_update/:id' => 'moim#moim_update'
  patch '/moim_update_new/:id' => 'moim#moim_update_new'

  # 모임 댓글 작성하기 & 삭제하기
  post '/moim_reply/:id' => 'moim#reply'
  post '/destroy3/:moim_id/:moimreply_id' => 'moim#destroy'
  
  
  # 동아리
  get '/dongari' => 'dongari#dongari'

  # 모임 글쓰기
  get '/dongari_new' => 'dongari#dongari_new'
  post '/dongari_create' => 'dongari#dongari_create'
  
  # 해당 모임 보여주기 & 삭제
  get '/dongari_show/:id' => 'dongari#dongari_show'
  post '/dongari_destroy/:id' => 'dongari#dongari_destroy'
  
  # 모임 수정하기
  get '/dongari_update/:id' => 'dongari#dongari_update'
  patch '/dongari_update_new/:id' => 'dongari#dongari_update_new'

  # 모임 댓글 작성하기 & 삭제하기
  post '/dongari_reply/:id' => 'dongari#reply'
  post '/destroy4/:dongari_id/:dongarireply_id' => 'dongari#destroy'
 

  # 내 페이지
  get '/my_page' => 'home#my_page'
  
  # 찜한 목록
  # get '/my_cart' => 'home#my_cart'
  
  # 좋아요
  post 'likes/:post_like_id' => 'likes#like_toggle'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
