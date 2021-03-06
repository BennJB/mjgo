class MoimController < ApplicationController
    
  before_action :authenticate_user!, except: [:friend, :communication, :art, :it, :study]
  before_action :set_moim, only: [:moim_show, :moim_destroy, :moim_update, :moim_update_new]
 
 
  def friend
   if params[:query].nil?
      @moims = Moim.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @moims = Moim.all.where("title LIKE ?", "%#{params[:query]}%") && Moim.all.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def communication
    if params[:query].nil?
      @moim = Moimcategory.find(1)  
      @moims = @moim.moims.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @moim = Moimcategory.find(1) 
      @moims = @moim.moims.where("title LIKE ?", "%#{params[:query]}%") && @moim.moims.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def art
    if params[:query].nil?
      @moim = Moimcategory.find(2)  
      @moims = @moim.moims.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @moim = Moimcategory.find(2) 
      @moims = @moim.moims.where("title LIKE ?", "%#{params[:query]}%") && @moim.moims.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def it
    if params[:query].nil?
      @moim = Moimcategory.find(3)  
      @moims = @moim.moims.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @moims = Moimcategory.find(3) 
      @moims = @moim.moims.where("title LIKE ?", "%#{params[:query]}%") && @moim.moims.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def study
    if params[:query].nil?
      @moim = Moimcategory.find(4)  
      @moims = @moim.moims.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @moim = Moimcategory.find(4) 
      @moims = @moim.moims.where("title LIKE ?", "%#{params[:query]}%") && @moim.moims.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def moim_new
    @moim = Moim.new
  end
  
  def moim_show
    # @moim_show = Moim.find(params[:id])
  end
  
  def moim_create
    @moim = Moim.new(moim_params)
    @moim.save!
    redirect_to "/moim_show/#{@moim.id}"
  end
  
  def moim_update
    if user_signed_in? && current_user.id == Moim.find(params[:id]).user_id 
    else
      redirect_to "/moim"
    end
    # @moim = Moim.find(params[:id])
  end
  
  def moim_update_new
    # @moim = Moim.find(params[:id])
    @moim.update(moim_params)
    @moim.save
    redirect_to "/moim_show/#{params[:id]}"
  end
  
  def moim_destroy
    # @moim = Moim.find(params[:id])
    @moim.destroy
    redirect_to '/moim'
  end

  def reply
    @reply = Moimreply.new
    @reply.content = params[:rep]
    @reply.moim_id =params[:id]
    @reply.user_id = current_user.id
    @reply.save
    redirect_to "/moim_show/#{params[:id]}"
  end
  
  def destroy
    @reply = Moimreply.find(params[:moimreply_id])
    @reply.destroy
    redirect_to "/moim_show/#{params[:moim_id]}"
  end
  
  private
  def set_moim
  @moim = Moim.find(params[:id])
  end

  def moim_params
  params.require(:moim).permit(:title, :person, :content, :mozip_id, :moimcategory_id, {image: []}).merge(user: current_user)
  end
    
end
