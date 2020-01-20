class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def show

    @user = User.find(current_user.id)
    @userr = User.all
    @event = Event.where(administrator: current_user.id)

  end


end
