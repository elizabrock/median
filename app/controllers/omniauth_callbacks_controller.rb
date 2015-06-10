class OmniauthCallbacksController < ApplicationController

  def twitter
    current_user.update = User.find_for_twitter_oauth(request.env["omniauth.auth"])
  end

end
