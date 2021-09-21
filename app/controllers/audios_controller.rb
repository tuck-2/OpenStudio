class AudiosController < ApplicationController
  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.user_id = current_user.id
    @audio.save
    redirect_to audios_path
  end

  def index
    @audios = Audio.all
  end

  def show
    @audio = Audio.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :description, :file, :img)
  end
end
