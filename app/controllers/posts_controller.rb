class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy ]

  # GET /posts or /posts.json
  def index
    @userid = params[:user_id]
    @postid = params[:post_id]
    @owner = User.find(@userid)
    
    #@posts = Post.all.where("user_id = ?", @userid)
    #@posts = @owner.posts.order(created_at: :desc)
    @posts = Post.joins(:user).select('users.user_name, post_content, posts.id, posts.user_id').order(created_at: :desc)

  end

  # GET /posts/1 or /posts/1.json
  def show
    @userid = params[:user_id]
    @postid = params[:id]
    @post = Post.find(@postid)
  end

  # GET /posts/new
  def new
    @userid = params[:user_id]
    @owner = User.find(@userid)
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    
    @postid = params[:id]
    @post = Post.find(@postid)
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path(@post.user_id), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_posts_path(@post.user_id), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(@post.user_id), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :post_content)
    end
end
