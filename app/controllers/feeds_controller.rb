class FeedsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.rss {render :layout => false}
    end
  end
end
