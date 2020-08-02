class PostsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  before_action :set_post, only: [:show]
  before_action :set_post_auth, only: [:update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: PostSerializer.new(@posts).serialized_json
  end

  # GET /posts/1
  def show
    render json: PostSerializer.new(@post).serialized_json
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: PostSerializer.new(@post).serialized_json
    else
      render json: PostSerializer.serialize(@post.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: PostSerializer.new(@post).serialized_json
    else
      render json: PostSerializer.serialize(@post.errors), status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_post_auth
      @post = current_user.posts.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, polymorphic: [:post])
    end
end
