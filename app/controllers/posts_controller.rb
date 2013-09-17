class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

    def show
    @post = Post.find(params[:id])
  end

 def new
    @post = Post.new
  end

  def create
    @posts = Post.new(post_params)

    if @post.save
      flash[:notice] = "You created a post."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])

    if @post.udate(params[:post])
      flash[:notice] = "You created a post"
      redirect_to root_path
    else
      render :edit
    end  
  end

  private
  def post_params
    params.require(:post).permit!
  end
end