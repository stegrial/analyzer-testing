require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Tumblr login and blogs adding' do
    visit 'https://www.tumblr.com/'

     sleep 1

     # find(:xpath, ta('Jul:tumblr:signup_btn', "(//button/span[@class='signup_get_started_btn active'])[1]")).click
     find(ta('Jul:tumblr:signup_btn')).click
     # find(:xpath, "(//button/span[@class='signup_get_started_btn active'])[1]").click

     # find(:xpath, ta('Jul:tumblr:signup_email', "//input[@id='signup_email']")).set('yourEmail@gmail.com')
     find(ta('Jul:tumblr:signup_email')).click
     # find(:xpath, "//input[id='signup_email']").click

     # find(:xpath, ta('Jul:tumblr:signup_password', "//input[@id='signup_password']")).set('4321test')
     find(ta('Jul:tumblr:signup_password')).click
     # find(:xpath, "//input[id='signup_email']").click

     # find(:xpath, ta('Jul:tumblr:signup_link', "//a[@class='signup_link login-button']")).click
     find(:xpath, ta('Jul:tumblr:signup_link')).click
     # find(:xpath, "//a[@class='signup_link login-button']").click

     # find(:xpath, ta('Jul:tumblr:signup_determine_email', "//input[@id='signup_determine_email']")).set('arapova.jul2@gmail.com')
     find(ta('Jul:tumblr:signup_determine_email')).click
     # find(:xpath, "//input[id='signup_determine_email']").click

     # find(:xpath, ta('Jul:tumblr:signup_determine_btn', "//span[@class='signup_determine_btn active']")).click
     find(:xpath, ta('Jul:tumblr:signup_determine_btn')).click
     # find(:xpath, "//a[@class='signup_determine_btn active']").click

     # find(:xpath, ta('Jul:tumblr:forgot_password_link', "//a[@class='forgot_password_link']")).click
     find(:xpath, ta('Jul:tumblr:forgot_password_link')).click
     # find(:xpath, "//a[@class='forgot_password_link']").

     # find(:xpath, ta('Jul:tumblr:signup_password', "//input[@id='signup_password']")).set('123456789QWERTY')
     find(ta('Jul:tumblr:signup_password')).click
     # find(:xpath, "//input[id='signup_password']").click

     # find(:xpath, ta('Jul:tumblr:signup_login_btn', "//span[@class='signup_login_btn active']")).click
     find(:xpath, ta('Jul:tumblr:signup_login_btn')).click
     # find(:xpath, "//a[@class='signup_login_btn active']").click

     # find(:xpath, ta('Jul:tumblr:dashboard:add_post_btn', "(//span[@class='icon_plus follow_icon'])[2]")).click
     find(:xpath, ta('Jul:tumblr:dashboard:add_post_btn')).click
     # find(:xpath, "(//span[@class='icon_plus follow_icon'])[2]").click

     # find(:xpath, ta('Jul:tumblr:dashboard:add_post_btn', "(//span[@class='icon_plus follow_icon'])[3]")).click
     find(:xpath, ta('Jul:tumblr:dashboard:add_post_btn')).click
     # find(:xpath, "(//span[@class='icon_plus follow_icon'])[3]").click

     sleep 5
  end
end
