class PostsController < ApplicationController
  
  before_action :set_post, only:[:show, :edit, :update]
  before_action :require_user, only:[:new, :create, :edit, :update]

  def index
    @post = Post.all
  end

  def show
    @comment = Comment.new
  end

 def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "You've created a post."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "You updated this post."
      redirect_to post_path(@post)
    else
      render :edit
    end  
  end

  private
  def set_post
    @post = Post.find(1)    
  end

  def post_params
    params.require(:post).permit!
  end
end