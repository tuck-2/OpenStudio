class CommentsController < ApplicationController
  def create
    audio = Audio.find(params[:audio_id])
    comment = current_user.comments.new(comment_params)
    comment.audio_id = audio.id
    comment.save
    redirect_to audio_path(params[:audio_id])
  end

  def update
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to audio_path(params[:audio_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
