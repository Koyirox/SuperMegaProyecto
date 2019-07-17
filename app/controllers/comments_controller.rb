class CommentsController < ApplicationController

    before_action :find_podcast
    before_action :find_comment, only: [:destroy]
    def create
        @comment = @podcast.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save

        if @comment.save
            redirect_to podcast_path(@podcast)
        else
            render 'new'
        end
    end

    def destroy
        @comment.destroy
        redirect_to podcast_path(@podcast)
    end

private

    def find_podcast
        @podcast = Podcast.find(params[:podcast_id])
    end

    def find_comment
        @comment = @podcast.comments.find(params[:id])
    end
end
