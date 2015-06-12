require "twitter"
require "oauth"

class PostsController < ApplicationController
  before_filter :load_post
  before_filter :load_user, except: [:new, :create]
  before_action :require_login, except: [:index, :show]

  def index
    @posts = @user.posts.all
  end

  def create
    @post.author = current_user
    if @post.save
      tweet
      redirect_to user_posts_path(current_user), notice: "Your knowledge has been published"
    else
      flash.alert = "Your knowledge could not be published. Please correct the errors below."
      render :new
    end
  end

  private

  def tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "AOWzSuHBxmEZWsPzVrglusfFh"
      config.consumer_secret     = "lrOamkizm6iz3g0DaQvP9PlUdCkM2w3zCdALpXelZITnnNiIP5"
      config.access_token        = @post.author.oauth_token
      config.access_token_secret = @post.author.oauth_secret
  end
      client.update("Check out my new post on Median: #{@post.title.upcase} - #{absolute_url}")
  end

  def absolute_url
    request.base_url  + "/users/1" + request.original_fullpath + "/#{@post.id}"
  end

  def load_post
    if params[:id].present?
      @post = Post.find(params[:id])
    else
      @post = Post.new
    end

    if params[:post].present?
      @post.assign_attributes(post_params)
    end
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
