class HistoricController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    @comments = current_user.comments
  end
end
