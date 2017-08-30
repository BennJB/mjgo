class DongariController < ApplicationController
    
  before_action :authenticate_user!, except: [:dongari]
  before_action :set_dongari, only: [:dongari_show, :dongari_destroy, :dongari_update, :dongari_update_new]
 
 
  def dongari
   if params[:query].nil?
      @dongaris = Dongari.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @dongaris = Dongari.all.where("title LIKE ?", "%#{params[:query]}%") && Dongari.all.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def dongari_new
    @dongari = Dongari.new
  end
  
  def dongari_show
    # @moim_show = Moim.find(params[:id])
  end
  
  def dongari_create
    @dongari = Dongari.new(dongari_params)
    @dongari.save!
    redirect_to "/dongari_show/#{@dongari.id}"
  end
  
  def dongari_update
    # @dongari = Dongari.find(params[:id])
  end
  
  def dongari_update_new
    # @dongari = Dongari.find(params[:id])
    @dongari.update(dongari_params)
    @dongari.save
    redirect_to "/dongari_show/#{params[:id]}"
  end
  
  def dongari_destroy
    # @dongari = Dongari.find(params[:id])
    @dongari.destroy
    redirect_to '/'
  end

  def reply
    @reply = Dongarireply.new
    @reply.content = params[:rep]
    @reply.dongari_id =params[:id]
    @reply.user_id = current_user.id
    @reply.save
    redirect_to "/dongari_show/#{params[:id]}"
  end
  
  def destroy
    @reply = Dongarireply.find(params[:dongarireply_id])
    @reply.destroy
    redirect_to "/dongari_show/#{params[:dongari_id]}"
  end
  
  private
  def set_dongari
  @dongari = Dongari.find(params[:id])
  end

  def dongari_params
  params.require(:dongari).permit(:title, :person, :place, :content, :mozipp_id, {image: []}).merge(user: current_user)
  end
    
end
