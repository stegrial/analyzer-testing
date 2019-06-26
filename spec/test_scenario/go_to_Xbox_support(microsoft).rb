require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Go to Xbox support(microsoft)' do
    visit 'https://www.microsoft.com/uk-ua/'

     sleep 1

     find(:xpath, ta('Jul:test:microsoft:xBox', "//a[@id='shellmenu_2']")).click
     # find(:xpath, ta('Jul:test:microsoft:xBox')).click
     # find(:xpath, "//a[@id='shellmenu_2']").click

     find(:xpath, ta('Jul:test:microsoft:selectGame', "//button[@id='c-shellmenu_40']")).click
     # find(:xpath, ta('Jul:test:microsoft:selectGame')).click
     # find(:xpath, "//a[@id='c-shellmenu_40']").click

     find(:xpath, ta('Jul:test:microsoft:xboxGamePass', "//a[@id='c-shellmenu_44']")).click
     # find(:xpath, ta('Jul:test:microsoft:xboxGamePass')).click
     # find(:xpath, "//a[@id='c-shellmenu_40']").click

     find(:xpath, ta('Jul:test:microsoft:support')).click
     # find(:xpath, ta('Jul:test:microsoft:support', "//li/a[@class='c-uhff-link x-hidden-focus']")).click
     # find(:xpath, "//li/a[@class='c-uhff-link x-hidden-focus']").click

     sleep 5

  end
end
