require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Venus - trends dropdown selecting' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
    end

    visit 'https://venus-preprod.moovweb.net/'

    sleep 3

    #go to trends category in swipe menu (black menu on top main page)
    find(:xpath, ta(   "Jul:venus:mainPage:trends")).click
    #find(:xpath, ta('Jul:venus:mainPage:trends', "(//div[@data-th='topNavClicked'])[6]")).click
    #find(:xpath, "(//div[@data-th='topNavClicked'])[6]").click

    sleep 3

    #click Trends Shop dropdown
    find(:xpath, ta(   "Jul:venus:trendsPage:trendsDropdown")).click
    #find(:xpath, ta('Jul:venus:trendsPage:trendsDropdown', "//div[@class='jss369 jss370 jss363 undefined jss358 jss253']")).click
    #find(:xpath, "//div[@class='jss369 jss370 jss363 undefined jss358 jss253']").click

    #click li 'In living color' in dropdown
    find(:xpath, ta(   'Jul:venus:trendsPage:livingcolorDropdown')).click
    #find(:xpath, ta('Jul:venus:trendsPage:livingcolorDropdown', "//li[text()='In living color']")).click
    #find(:xpath, "//li[text()='In living color']").click

    #click trends category in swipe menu again( in this plase test fail)
    find(:xpath, ta(   "Jul:venus:mainPage:trends")).click
    #find(:xpath, ta('Jul:venus:mainPage:trends', "(//div[@data-th='topNavClicked'])[6]")).click

    sleep 10
  end
end
