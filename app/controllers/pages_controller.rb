class PagesController < ApplicationController
  before_action :member_signed_in?, only: [:member]

  def home
  end

  def get_groups
    current_user = User.first
    oauth_token = current_user.token
    member_id = current_user.uid
    @groups = Meetup.new(oauth_token, member_id).groups
    respond_to do |format|
      format.js
    end
  end

  def member
    current_user = User.first
    oauth_token = current_user.token
    member_id = current_user.uid
    debugger
    @groups = Meetup.new(oauth_token, member_id).groups
    @recommended_events = Meetup.new(oauth_token, member_id).recommended_events
    @events = Meetup.new(oauth_token, member_id).events
  end

  private
    def member_signed_in?
      if !current_user
        redirect_to root_url
      end
    end
end
