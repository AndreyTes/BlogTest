class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy delete_image]

  def index
    @posts = Post.includes(:user)
    @posts = @posts.filter_by_current_user(current_user).paginate(page: params[:page], per_page: 3) if params[:user].present?
    @posts = @posts.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def show; end

  def new
    @post = current_user.posts.new
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def delete_image
    @post.image.purge
    redirect_back_or_to({ action: "edit", id: @post.id })
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
