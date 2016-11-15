Rails.application.config.middleware.use OmniAuth::Builder do
  provider :meetup, ENV['MEETUP_KEY'], ENV['MEETUP_SECRET'], callback_url: ENV['CALLBACK_URL']
end
