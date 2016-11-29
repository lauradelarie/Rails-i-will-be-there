class PagesController < ApplicationController
  before_action :member_signed_in?, only: [:member]

  def home
  end

  def get_groups
    users_with_token = User.where.not(token: [nil, ''])
    current_user = users_with_token[0]
    oauth_token = current_user.token
    member_id = current_user.uid
    @groups = Meetup.new(oauth_token, member_id).groups
    @user = User.first

    respond_to do |format|
      format.js
      format.json { render json: @groups, status: :success }
    end
  end

  def member
    users_with_token = User.where.not(token: [nil, ''])
    current_user = users_with_token[0]
    # current_user = User.first
    oauth_token = current_user.token
    member_id = current_user.uid
    # groups and user are rendered in groups partial
    @groups = Meetup.new(oauth_token, member_id).groups
    @user = User.first
    @recommended_events = Meetup.new(oauth_token, member_id).recommended_events
    @events = Meetup.new(oauth_token, member_id).events
    @favourites = Favourite.all
    @favourite = Favourite.new
  end

  def create
    favourite = Favourite.create(fave_params)
    if favourite.save
      render status: 200, json: {
        message: "Group added to favourites!",
        favourite: favourite
      }.to_json
    else
      render status: 422, json: {
        error: favourite.errors.full_messages
      }.to_json
    end
  end

  def update
    favourite = Favourite.find(params[:id])
    favourite.update(fave_params)
    if favourite.save
      render status: 200, json: {
        favourite: favourite
      }.to_json
    else
      render status: 422, json: {
        error: favourite.errors.full_messages
      }.to_json
    end
  end

  private

    def fave_params
      params.require(:favourite).permit(:group_id, :group_name, :user_id, :active)
    end

    def member_signed_in?
      if !current_user
        redirect_to root_url
      end
    end
end
