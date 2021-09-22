class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    audio = Audio.find(params[:audio_id])
    favorite = current_user.favorites.new(audio_id: audio.id)
    favorite.save
    redirect_to audio_path(audio)
  end

  def destroy
    audio = Audio.find(params[:audio_id])
    favorite = current_user.favorites.find_by(audio_id: audio.id)
    favorite.destroy
    redirect_to audio_path(audio)
  end
end
