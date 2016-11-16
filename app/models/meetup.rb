class Meetup
  include HTTParty

  def initialize(oauth_token, member_id)
    self.class.base_uri "https://api.meetup.com"
    @member_id = member_id

    @options = {
      headers: {
        "Authorization" => "Bearer #{oauth_token}"
      }
    }
  end

  def groups
    self.class.get("/2/groups?member_id=#{@member_id}", @options).parsed_response["results"]
  end

  def recommended_events
    self.class.get("/recommended/events?page=10", @options)
  end

  def events
    self.class.get("/2/events?member_id=#{@member_id}&page=10", @options).parsed_response["results"]
  end
end
