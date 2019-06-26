require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://nintendo.com/'

    find(ta('p:nintendo:home:aboutnintendo')).click
    find(ta('p:nintendo:aboutnintendo:manuals')).click

    visit 'https://nintendo.com/'
    find(ta('p:nintendo:home:companyinfo')).click
    find(ta('p:nintendo:aboutnintendo:manuals')).click

    visit 'https://nintendo.com/'
    find(ta('p:nintendo:home:visitSite')).click

    visit 'https://nintendo.com/'


    sleep 5

  end
end
