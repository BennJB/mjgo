class LikesController < ApplicationController
    
       before_action :authenticate_user!  # 로그인한 회원만 보기 위해서!
    
    def like_toggle
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_like_id])
                                                 # post_id는 post '/like/:post_like_id' 로 넘겨 받은 값.
        if like.nil?        # 좋아요 한 유저가 없다면, 좋아요.
            Like.create(user_id: current_user.id, post_id: params[:post_like_id])
        else
            like.destroy    # 좋아요 한 유저가 있으면, 좋아요 취소.    
        end
         redirect_to "/show/#{params[:post_like_id]}"
        #  redirect_to "/eat/coupon/#{params[:post_like_id]}"
    end
end

