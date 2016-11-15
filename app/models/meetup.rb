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
    debugger
    self.class.get("/2/groups?member_id=#{@member_id}", @options).parsed_response["results"]
  end
end
