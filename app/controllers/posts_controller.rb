class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def tagged
    if params[:tag].present?
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      @post.save
      format.html { redirect_to posts_path }
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      @post.update(post_params)
      format.html { redirect_to posts_path}
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @comment = @post.comments.where(post_id: @post.id)
    @comment.each do |comment|
      comment.destroy
    end
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :tag_list)
    end
end
