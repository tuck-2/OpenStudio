class AudiosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.user_id = current_user.id
    if @audio.save
      redirect_to audios_path
    else
      render :new
    end
  end

  def index
    @audios = Audio.all.order(created_at: "DESC")
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
    audio = Audio.find(params[:id])
    if audio.user == current_user
      audio.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to audio_path(audio.id)
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :description, :file, :img)
  end
end
