Rails.application.routes.draw do
  
  # 전체 게시판
  root 'eat#index'
  
  mount ActionCable.server => '/cable'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
                                       
  resources :conversations do
    resources :messages
  end
  
  get '/index' => 'home#index'
  
  # 페이스북 가입 시, 이메일 없으면 경고 경로 
  get '/no_email' => 'home#no_email'
 
  # category 기타
  get '/box' => 'home#box'
  
  # 게시판 글쓰기
  get '/new' => 'home#new'
  get '/item_new' => 'home#item_new'
  post '/create' => 'home#create'
  
  # 해당 게시글 보여주기 & 삭제
  get '/show/:id' => 'home#show'
  post '/destroy/:id' => 'home#destroy'
  
  # 게시글 수정하기
  get '/update/:id' => 'home#update'
  # get '/item_update/:id' => 'home#item_update'
  patch '/update_new/:id' => 'home#update_new'
  
  # 댓글 작성하기 & 삭제하기
  post '/reply/:id' => 'home#reply'
  post '/destroy2/:post_id/:reply_id' => 'home#destroy2'
  
  # 모임
  get '/moim' => 'moim#friend'
  get '/communication' => 'moim#communication'
  get '/art' => 'moim#art'
  get '/it' => 'moim#it'
  get '/study' => 'moim#study'
  
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
  
  
  # ---------------- 메인 가게 리스트 
  get '/menu1' => 'menu1#menu1'
  get '/menu2' => 'menu2#menu2'
  get '/menu3' => 'menu3#menu3'
  get '/menu4' => 'menu4#menu4'
  get '/menu5' => 'menu5#menu5'
   
  get '/food1' => 'eat#food1'
  get '/food2' => 'eat#food2'
  get '/food3' => 'eat#food3'
  get '/food4' => 'eat#food4'
  get '/food5' => 'eat#food5' 
   
  get '/random_cook' => 'eat#random_cook'
  get '/random_page' => 'eat#random_page'
  get '/every_map' => 'eat#every_map'
  
  # 이벤트 등록
  get '/new_event/:id' => 'eat#new_event'
  post '/event_create/:id' => 'eat#event_create'
  
  # 이벤트 수정
  get '/event_update/:cook_id/:cookevent_id' => 'eat#event_update'
  post '/event_update_new/:cook_id/:cookevent_id' => 'eat#event_update_new'

  # 이벤트 삭제
  post '/destroy6/:cook_id/:cookevent_id' => 'eat#destroy3'
  
  
  # 가게 등록
  get '/eat_new' => 'eat#eat_new'
  post '/eat_create' => 'eat#create'
  
  # 가게 보여주기 & 삭제
  get '/eat_show/:id' => 'eat#eat_show'
  post '/eat_destroy/:id' => 'eat#destroy'
  
  # 가게 수정하기
  get '/eat_update/:id' => 'eat#eat_update'
  patch '/eat_update_new/:id' => 'eat#eat_update_new'
  
  # 가게 댓글 작성하기 & 삭제하기
  post '/cook_reply/:id' => 'eat#reply'
  post '/destroy5/:cook_id/:cookreply_id' => 'eat#destroy2'
  
  
  
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
