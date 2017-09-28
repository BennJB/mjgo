class EatController < ApplicationController
    
    before_action :authenticate_user!, except: [:index, :food1, :food2, :food3, :food4, :food5, :random_cook, :random_page, :every_map, :eat_show]
    before_action :set_cook, only: [:eat_show, :destroy, :eat_update, :eat_update_new]


  def index
    if params[:query].nil?
    @cooks == nil
    else
    @queryname = params[:query]     # 검색어 입력되면, 출력하려고 변수에 저장
    @cooks = Cook.all.where("title LIKE ? OR content LIKE ?", "%#{params[:query]}%","%#{params[:query]}%") && Cook.all.where("title LIKE ? OR content LIKE ?", "%#{params[:query].gsub(" ","")}%","%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)  
    end
  end
  
  def random_cook
  end
  
  def random_page
    @random = Cook.all.sample(1)
  end
  
  def every_map
    @map = Cook.all
  end
  
  def new_event
    if user_signed_in? && ( current_user.id == Cook.find(params[:id]).user_id or current_user.admin? )  
    @cook = Cook.find(params[:id])  
    else
    redirect_to "/"
    end
  end  
  
  def event_create
    @event = Cookevent.new
    @event.title = params[:title]
    @event.image = params[:image]
    @event.cook_id =params[:id]
    @event.user_id = current_user.id
    @event.save!
    redirect_to "/eat_show/#{@event.cook_id}"
  end
  
  
  # 이벤트 수정
  def event_update
    if user_signed_in? && ( current_user.id == Cook.find(params[:id]).user_id or current_user.admin? )
    @event = Cookevent.find(params[:cookevent_id]) 
    else
    redirect_to "/"
    end
  end
  
  def event_update_new
    @event = Cook.find(params[:cook_id]).cookevents.find(params[:cookevent_id])
    @event.title = params[:title]
    @event.image = params[:image]
    @event.cook_id =params[:cook_id]
    @event.user_id = current_user.id
    @event.save!
    redirect_to "/eat_show/#{@event.cook_id}"
  end
  
  # 이벤트 삭제 
  def destroy3
    @event = Cook.find(params[:cook_id]).cookevents.find(params[:cookevent_id])
    @event.destroy
    redirect_to "/eat_show/#{@event.cook_id}"
  end
  
  
  def food1
    @map = Cooklist.find(1).cooks
  end
  def food2
    @map = Cooklist.find(2).cooks
  end
  def food3
    @map = Cooklist.find(3).cooks
  end
  def food4
    @map = Cooklist.find(4).cooks
  end
  def food5
    @map = Cooklist.find(5).cooks
  end
  
  def eat_new
    if user_signed_in? && (current_user.storeceo? or current_user.admin)  
    @cook = Cook.new
    else
    redirect_to "/"
    end
  end
  
  def eat_show
      if @cook.cookreplies.blank?
      @avg_review = 0
      else
      @avg_review = @cook.cookreplies.average(:rating).round(2)
      end
    # @cook = Cook.find(params[:id])
  end
  
  def create
    @cook = Cook.new(cook_params)
    @cook.save!
    redirect_to "/eat_show/#{@cook.id}"
  end
  
  
  def eat_update
    if user_signed_in? && (current_user.id == Cook.find(params[:id]).user_id or current_user.admin)
    else
      redirect_to "/"
    end
  end
  
  def eat_update_new
    # @cook = Cook.find(params[:id])   # 새로운 행에 쓰는 게 아니라, 덮어쓸 게시글을 뽑아 온거임.
    @cook.update(cook_params)
    @cook.save  
    redirect_to "/eat_show/#{params[:id]}"
  end
  
  def destroy
    if user_signed_in? && (current_user.id == Cook.find(params[:id]).user_id or current_user.admin)
    @cook.destroy
    redirect_to "/"
    else
    redirect_to "/"
    end
  end
  
  def reply
    new_reply = Cookreply.new
    new_reply.content = params[:rep]
    new_reply.image = params[:image]
    new_reply.rating = params[:rating]
    new_reply.cook_id =params[:id]
    new_reply.user_id = current_user.id
    new_reply.save
    redirect_to "/eat_show/#{params[:id]}"
  end
  
  def destroy2
    @a = Cookreply.find(params[:cookreply_id])
    @a.destroy
    redirect_to "/eat_show/#{params[:cook_id]}"
  end
  
  
  private
  def set_cook
    @cook = Cook.find(params[:id])
  end
  
  def cook_params
  params.require(:cook).permit(:title, :address, :phone, :opertime, :latitude, :longitude, 
  :menuone, :menutwo, :menuthr, :menufour, :menufive, 
  :one, :two, :thr, :four, :five, :cookchoice_id, :cooklist_id, {image: []}).merge(user: current_user)
  end
  
end