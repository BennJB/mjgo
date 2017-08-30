class HomeController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :etc, :team, :friend, :every_item, :no_email]
  before_action :set_post, only: [:show, :destroy, :update, :item_update, :update_new]

  def index
    if params[:query].nil?
      @books = Category.find(1)  
      @posts = @books.posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @books = Category.find(1) 
      @posts = @books.posts.where("title LIKE ?", "%#{params[:query]}%") && @books.posts.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def etc
   if params[:query].nil?
      @books = Category.find(2)  
      @posts = @books.posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @books = Category.find(2) 
      @posts = @books.posts.where("title LIKE ?", "%#{params[:query]}%") && @books.posts.where("title LIKE ?", "%#{params[:query].gsub(" ","")}%").order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def new
    @post = Post.new
  end
  
  def item_new
    @post = Post.new
  end
  
  def show
    # @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    # @post.title = params[:title]
    # @post.price = params[:price]
    # @post.place = params[:place]
    # @post.content = params[:content]
    # @post.image = params[:image]
    # post.user_id = current_user.id
    # @post.user = current_user
    @post.save
    redirect_to "/show/#{@post.id}"
  end
  
  def update
    # @post = Post.find(params[:id])
  end
  
  def update_new
    # @post = Post.find(params[:id])   # 새로운 행에 쓰는 게 아니라, 덮어쓸 게시글을 뽑아 온거임.
    @post.update(post_params)
    @post.save  
    redirect_to "/show/#{params[:id]}"
  end
  
  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/index'
  end
  
  def reply
    new_reply = Reply.new
    new_reply.content = params[:rep]
    new_reply.post_id =params[:id]
    new_reply.user_id = current_user.id
    new_reply.save
    redirect_to "/show/#{params[:id]}"
  end
  
  def destroy2
    @a = Reply.find(params[:reply_id])
    @a.destroy
    redirect_to "/show/#{params[:post_id]}"
  end

  def my_page
    @my_page = Post.where(user_id: current_user.id).order('created_at DESC').paginate(page: params[:page], per_page: 5)
    @my_reply = Reply.where(user_id: current_user.id).order('created_at DESC').paginate(page: params[:page], per_page: 5)
    @moim = Moim.where(user_id: current_user.id).order('created_at DESC').paginate(page: params[:page], per_page: 5)
    @moim_reply = Moimreply.where(user_id: current_user.id).order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end
  
  
  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
  params.require(:post).permit(:title, :price, :standard, :company, :writename, :content, :selling_id, :category_id, {image: []}).merge(user: current_user)
  end

end
