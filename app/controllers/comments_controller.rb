class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all.order(:updated_on)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      @comment.save
      format.html { redirect_to posts_path }
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    respond_to do |format|
      @comment.destroy
      format.html { redirect_to posts_path }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:title, :content, :post_id)
  end
end
