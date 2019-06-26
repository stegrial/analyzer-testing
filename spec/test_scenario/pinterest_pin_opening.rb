require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Pinterest check pin opening' do
    visit 'https://www.pinterest.com/'

    sleep 1
     find(ta('Jul:pinterest:sign_in:emailField')).set('arapova.jul2@gmail.com')
     #find(:id, 'email').set('arapova.jul2@gmail.com')

     find(ta('Jul:pinterest:sign_in:pass_Field')).set('4321test')
     #find(:id, 'password').set('4321test')

     find(:xpath, "//button[@class='red SignupButton active']").click
     #find(:xpath, ta('Jul:pinterest:sign_in:OkButton:acceptBtn')).click

    sleep 3
     find(:xpath, ta('Jul:pinterest:main_page:image', "(//div[@class='Collection-Item'])[12]")).click
     #find(:xpath, "(//div[@class='Collection-Item'])[12]").click
     #find(ta('Jul:pinterest:main_page:image')).click

    sleep 3
  end
end
