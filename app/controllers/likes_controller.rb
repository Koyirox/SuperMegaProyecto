class LikesController < ApplicationController

    before_action :authenticate_user!, only: [:show]

    before_action :find_podcast 

  def create
   
    if already_liked?
      
    flash[:notice] = "You can't like more than once"
    else
    @podcast.likes.create(user_id: current_user.id)
    end
    redirect_to podcast_path(@podcast)

    
  end 

  private

  def find_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end
  

  def already_liked?
  Like.where(user_id: current_user.id, podcast_id:
  params[:podcast_id]).exists?
  end
end
