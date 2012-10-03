class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        flash[:notice] = "Comment Added"
      else 
        format.html { render action: "new" }
      end
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comments
  end
end
