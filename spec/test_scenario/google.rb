require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
    visit 'https://google.com'

    # google applications btn click
    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:accountBtn')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:search')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:mapsBtn')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:youTube')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:play')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:gmail')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:contacts')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:drive')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:calendar')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:googlePlus')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:translate')).click
    sleep 2
    page.go_back

    find(ta('p:google:mainpage:googleApplications')).click
    find(ta('p:google:mainpage:googleApplications:photos')).click
    sleep 2
    page.go_back

    # find(ta('p:google:mainpage:searchFld')).set('trueautomation')
    # find(ta('p:google:mainpage:searchFld')).native.send_keys(:enter)
    #
    # find(ta('p:google:searchResult:imagesBtn')).click

    sleep 5


  end
end
