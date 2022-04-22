class LikesController < ApplicationController
    before_action :set_user
    skip_before_action :verify_authenticity_token

    def new
        @like = Like.new
    end

    def create

        likeable_type = params[:likeable_type]
        if likeable_type == "Post"
            post = Post.find(params[:likeable_id])
            Like.create(likeable: post, user: @user)
        

        else
            comment = Comment.find(params[:likeable_id])
            Like.create(likeable: comment, user: @user)
        end

        redirect_back(fallback_location: root_path)

    end    

    def destroy

        @like = Like.find(params[:likeable_id])

        
        if @like.destroy
            redirect_back(fallback_location: root_path)
        end

    end


    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:user_id])
    end


    def like_params
        params.require(:like).permit(:likeable_type, :likeable_id)
    end

end