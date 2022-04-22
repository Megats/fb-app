class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @postid = params[:post_id]
    @userid = params[:user_id]
    @post = Post.find(@postid)

    if current_user
      @owner = User.find(current_user)

    else
        @owner = Admin.find(current_admin)
    end    

    @display = User.find(@user_id)

  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @userid = params[:user_id]
    @postid = params[:post_id]
    
    if current_user
      @owner = User.find(current_user.id)

    else
      @owner = Admin.find(current_admin.id)
    end    
    
    @post = Post.find(@postid)

    @comments = @post.comments
    # @comments = User.select("users.user_name, comments.comment_content").joins(:comments).where("post_id = ?", @postid)
    
    @poster = User.select("users.user_name").joins(:posts).where("posts.id = ?", @postid)
    @postowner = @poster.first
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @userid = params[:user_id]
    @postid = params[:post_id]
    @owner = User.find(@userid)

  end

  # POST /comments or /comments.json
  def create
    @userid = params[:user_id]
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to new_user_post_comment_path(@comment.user_id, @comment.post_id), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to new_user_post_comment_path(@comment.user_id, @comment.post_id), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to new_user_post_comment_path(@comment.user_id, @comment.post_id), notice: "Comment was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment_content)
    end
    
end
