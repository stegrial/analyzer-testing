require 'spec_helper'

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TrueAutomation.IO capybara example' do

  scenario 'Test sencha dropdawn' do
    # Element is recorded after reloading the page

    visit 'https://examples.sencha.com/coworkee/#login'

    # sleep 3
    # find(:xpath, "//button[@class='x-button-el']", visible: false).click
    find(:xpath, ta('sencha:login_btn', "//button[@class='x-button-el']"), visible: false).click
    # find(ta('sencha:login_btn'), visible: false).click

    # sleep 3
    # find(:xpath, "(//span[@class='icon x-fa fa-sitemap'])[1]").click
    find(:xpath, ta('sencha:organizations', "(//span[@class='icon x-fa fa-sitemap'])[1]"), visible: false).click
    # find(ta('sencha:organizations')).click

    # sleep 3
    # Capybara.current_session.driver.browser.navigate.refresh #refreshing the page

    # sleep 10
    # find(:xpath, "//div[@id='ext-expandtrigger-1']/div").click
    # path = find(:xpath, "//div[@id='ext-expandtrigger-1']/div").path
    # puts path.downcase
    # find(:xpath, ta('sencha:dropdawn:after_reload', "//div[@id='ext-expandtrigger-1']/div")).click
    find(ta('sencha:dropdawn:after_reload'), visible: false).click #recording after reloading the page
    # find(ta('sencha:dropdawn:before_reload'), visible: false).click #worked (recording before the reloading page )

  sleep 3
  end
end

end
