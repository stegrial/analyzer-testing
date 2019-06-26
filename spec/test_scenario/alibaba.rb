require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
    visit 'https://www.alibaba.com'
    Capybara.current_session.driver.browser.manage.window.resize_to(1440, 900)

    find(ta('p:alibaba:home:searchField')).set('airpods')

    find(ta('p:alibaba:home:searchButton')).click
    sleep 7
    find(ta('p:alibaba:home:results:likeBtn')).click  #wrong button click

    sleep 2
  end
end
