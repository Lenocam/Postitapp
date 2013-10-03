class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :vote]
  before_action :require_user, only: [:create, :vote]
  

  def create
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment Saved"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

   def vote
    @comment = Comment.find(params[:id])
    vote = Vote.new(:user => current_user, :voteable => @comment, :vote => params[:vote])

    respond_to do |format|
      format.html do
        if vote.save
          flash[:notice] = "Your vote counted!"
        else
          flash[:error] = "Your vote did not count."
        end
        redirect_to post_path(params[:post_id])
      end
      format.js {render :js => "alert('Vote failed')" unless vote.save}
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find_by(params[:post_id])
  end
end
