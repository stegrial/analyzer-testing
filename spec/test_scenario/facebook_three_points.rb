require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do

  scenario 'Facebook three points' do
    visit 'https://www.facebook.com'
    # select "10", :from => ta('day')

    find(:id, 'email').set('eshapovalov298@gmail.com')
    # find(ta('sign_in:email_field')).set('eshapovalov298@gmail.com')

    find(:id, 'pass').set('Tester1234')
    # find(ta('sign_in:pass_field')).set('Tester1234')

    find(:id, 'loginbutton').click
    # find(ta('sign_in:login_btn')).click

    find(:xpath, "//span[text()='Mark']").click
    # find(ta('home:profile')).click

    sleep 10
    # path = find(:xpath, "(//a[@data-testid='post_chevron_button'])[2]").path
    # puts path.downcase
    find(ta('home:three_points')).click

    sleep 3
  end
end
