class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @posts = Post.new(params[:post].permit(:url, :title, :description))
    if @post.save
      redirect_to @post
    else
      render 'new'
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])

    if @post.udate(params[:post].permit(:url, :title, :description))
    redirect_to @post
    else
    render 'edit'
    end  
  end

  def patch
  end

  def put
  end
end
