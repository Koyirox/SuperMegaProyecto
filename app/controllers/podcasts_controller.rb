class PodcastsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  def index
   @podcasts = Podcast.all
  end

  def new
    @podcast = Podcast.new
    
  end

  def create
    
    @podcast = Podcast.new(podcast_params)
    @podcast.user = current_user

    @podcast.file.attach(podcast_params)

    @podcast.save
    redirect_to podcasts_path
  end

  def show
    @podcast = Podcast.find(params[:id])
  end 

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
    @podcast.update(podcast_params)
    redirect_to podcasts_path

  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy
    redirect_to podcasts_path
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :file)
  end

end