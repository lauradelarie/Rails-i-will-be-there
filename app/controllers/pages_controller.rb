class PagesController < ApplicationController

  def home
    oauth_token = current_user.token
    member_id = current_user.uid
    @groups = Meetup.new(oauth_token, member_id).groups
  end
end
