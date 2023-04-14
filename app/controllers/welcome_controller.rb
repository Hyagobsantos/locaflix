class WelcomeController < ApplicationController
  skip_before_action :authenticate!

  def index
    @comments_welcome = Comment.all.reverse
  end
end
