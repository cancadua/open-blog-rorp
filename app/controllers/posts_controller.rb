class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_tags

ActsAsTaggableOn.default_parser = TagParser
ActsAsTaggableOn.remove_unused_tags = true

  def index
    if params[:search]
      @posts = Post.all.where("title LIKE :search OR content LIKE :search", search: "%#{params[:search].downcase}%").order(updated_on: :desc)
    elsif params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(updated_on: :desc)
    else
      @posts = Post.all.order(updated_on: :desc)
    end
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

  def set_tags
    @all_tags = ActsAsTaggableOn::Tag.all.uniq
  end

  def search

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
