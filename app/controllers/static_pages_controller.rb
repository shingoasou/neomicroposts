class StaticPagesController < ApplicationController
  def home
    @neomicropost = current_user.neomicroposts.build if logged_in?
  end
end