require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Cryptocompare Mining pools' do
    visit 'https://www.cryptocompare.com/'

    find(ta('cryptocompare:mining')).click
    find(ta('cryptocompare:mining_pools')).click

    sleep 3
  end
end
