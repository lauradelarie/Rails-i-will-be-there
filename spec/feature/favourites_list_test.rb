require 'rails_helper'

feature "Favourites list", js: true do

  scenario 'add group to favourites' do

    visit member_path

    click_button('#add-favourite'), match: :first)

    page.execute_script(submitFavourite())

    expect(page).to have_content('React Amsterdam')

  end


  # scenario 'removes favourite from list when checking box' do
  #
  #   visit member_path
  #
  #
  #
  #
  # end
end
