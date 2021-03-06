class PostsController < ApplicationController
  
  before_action :set_post, only:[:show, :edit, :update, :vote]
  before_action :require_user, only:[:new, :create, :edit, :update, :vote]
  

  def index
    @post = Post.all
    @post = Post.all.sort_by {|x| x.total_votes}.reverse
    @categories = Category.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.all

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

  def vote
    Vote.create(voteable:@post, user:current_user, vote: params[:vote])
    respond_to do |format|
      format.html { redirect_to :back, notice: "Your vote counted. Witness Democracy in action!" }
      format.js
    end
  end

  private
  def set_post
    @post = Post.find_by slug: params[:id]  
  end

  def post_params
    params.require(:post).permit!
  end
end