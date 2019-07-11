require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do

  scenario 'Test sencha first manager' do
    visit 'https://examples.sencha.com/coworkee/#login'

    sleep 5
    # find(:xpath, "//button[@class='x-button-el']", visible: false).click
    find(ta('sencha:login_btn'), visible: false).click

    sleep 5
    # find(:xpath, "(//span[@class='icon x-fa fa-sitemap'])[1]").click
    find(ta('sencha:organizations')).click

    # sleep 2
    # Capybara.current_session.driver.browser.navigate.refresh #refreshing the page

    sleep 5
    find(:xpath, "//div[@id='ext-expandtrigger-1']/div").click
    # find(:xpath, ta('sencha:dropdawn', "//div[@id='ext-expandtrigger-1']/div")).click
    # find(ta('sencha:dropdawn'), visible: false).click

    sleep 5
    # find(:xpath, "(//span[@class='x-list-label'])[1]").click
    # find(:xpath, ta('sencha:first_manager:before_refresh_1', "(//span[@class='x-list-label'])[1]")).click
    # path = find(:xpath, "(//span[@class='x-list-label'])[1]").path
    # puts path.downcase
    # find(ta('sencha:first_manager:1')).click #first version (element is recorded with old signature)
    # find(ta('sencha:first_manager:before_refresh_1')).click #recording without the page refreshing
    # find(ta('sencha:first_manager:before_refresh_2')).click #recording without the page refreshing
    find(ta('sencha:first_manager:after_refresh_2')).click #recording after the page refreshing

  sleep 5
  end
end
