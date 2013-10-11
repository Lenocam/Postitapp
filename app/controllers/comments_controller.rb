class CommentsController < ApplicationController
  before_action :require_user, only: [:create, :vote]
  

  def create
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
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        flash[:notice] = "Your vote counted!"
        redirect_to post_path(params[:id])
      end
      format.js
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
