require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://tehnoezh.ua'
    #sleep 60


    #find(:xpath, ('//a[@href="/apple-aksessuary/"]')).hover
    #find(ta('appleaksessuary')).hover
    find(:xpath, ta( 'appleaksessuary','//a[@href="/apple-aksessuary/"]')).hover


    #find(:xpath, ('//a[@href="/apple-aksessuary/apple-lens/"]')).click
    #find(ta('appleaksessuary:applelens')).click
    find(:xpath, ta( 'p:appleaksessuary:applelens','//a[@href="/apple-aksessuary/apple-lens/"]')).click


    #find(:xpath, ('//div[@data-id="112017"]')).click
    #find(ta('p:id112017')).click
    find(:xpath, ta('p:id112017', '//div[@data-id="112017"]')).click

    sleep 3

  end
end
