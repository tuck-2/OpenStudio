class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_audios = @user.audios
  end
end
