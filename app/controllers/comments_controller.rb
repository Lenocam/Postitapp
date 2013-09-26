class CommentsController < AppllicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.new(params.require(:comment).permit(:body))

    if @comment.save
      flash[:notice] = "Comment Saved"
      redirect_to post_path(@post)
    else
      render post_path(@post)
      
    end
  end
end
