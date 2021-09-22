class AudiosController < ApplicationController
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
    Audio.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :description, :file, :img)
  end
end
