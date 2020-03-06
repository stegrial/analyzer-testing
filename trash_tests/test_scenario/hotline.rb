require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://hotline.ua/'

    # close popup window your city
    #find(:css, ('.close')).click
    find(:css, ta('p:hotline:home:closePopup', '.close')).click
    #find(ta('p:hotline:home:closePopup')).click

    fill_in ta('p:hotline:home:searchbox'), with: 'iphone'

    find(ta('p:hotline:home:searchBtn')).click

    find(ta('p:hotline:home:searchResults:comparePrise')).click

    find(ta('p:hotline:home:searchResults:showOffers')).click

    find(ta('p:hotline:home:searchResults:condUsed')).click

    puts(find(ta('p:hotline:home:searchResults:goToMarket')).text)


    sleep 3
  end
end
