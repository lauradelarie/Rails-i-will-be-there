require 'rails_helper'

feature "Login with Meetup", js: true do

  scenario 'direct to Meetup login' do

    visit root_path

    click_link('.sign-in')

    page.has_xpath?('/auth/meetup')

  end

end
