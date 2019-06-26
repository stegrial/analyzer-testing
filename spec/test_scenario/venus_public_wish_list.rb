require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Venus - changing wish list on public ' do
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

    #click on account icon
    #find(:xpath, ta("Jul:venus:mainPage:accountIcon")).click
    find(:xpath, ta('Jul:venus:mainPage:accountIcon', "//div[@class='jss11 jss41']//button")).click
    #find(:xpath, "//div[@class='jss11 jss41']//button").click

    sleep 5

    #enter the login password
    find(:xpath, ta("Jul:venus:loginPage:email")).set('lidnevskyy.vladimir@Moovweb.com')
    #find(:xpath, ta('Jul:venus:loginPage:email', "//input[@id='ctl00_Body1_loginemail']")).set('lidnevskyy.vladimir@Moovweb.com')
    #find(:xpath, "//input[@id='ctl00_Body1_loginemail']").set('lidnevskyy.vladimir@Moovweb.com')

    #enter the password
    find(:xpath, ta('Jul:venus:loginPage:pass')).set('asdffdsA1')
    #find(:xpath, ta('Jul:venus:loginPage:pass', "//input[@id='ctl00_Body1_loginpassword']")).set('asdffdsA1')
    #find(:xpath, "//input[@id='ctl00_Body1_loginpassword']").set('asdffdsA1')

    #click signIn
    find(:xpath, ta("Jul:venus:loginPage:signIn")).click
    #find(:xpath, ta('Jul:venus:loginPage:signIn', "//a[@id='ctl00_Body1_loginbutton']")).click
    #find(:xpath, "//a[@id='ctl00_Body1_loginbutton']").click

    sleep 5

    #click order history
    find(:xpath, ta("Jul:venus:loginPage:orderHistory")).click
    #find(:xpath, ta('Jul:venus:loginPage:orderHistory', "//a[@id='ctl00_sidebarNav_accountsidebar1_hypOrderHistory']")).click
    #find(:xpath, "//a[@id='ctl00_sidebarNav_accountsidebar1_hypOrderHistory']").click
    sleep 5

    #click wish list
    find(:xpath, ta("Jul:venus:loginPage:wishList")).click
    #find(:xpath, ta('Jul:venus:loginPage:wishList', "//a[@id='ctl00_sidebarNav_accountsidebar1_hypWishlist']")).click
    #find(:xpath, "//a[@id='ctl00_sidebarNav_accountsidebar1_hypWishlist']").

    sleep 5

    # click on checkbox to select public in wishlist privacy block
    find(:xpath, ta("Jul:venus:loginPage:publicWishList")).click
    #find(:xpath, ta('Jul:venus:loginPage:publicWishList', "//input[@id='ctl00_Body1_publicflagon']")).click
    #find(:xpath, "//input[@id='ctl00_Body1_publicflagon']").

    sleep 5

    #come back to order history (in this place he clicks in wrong link)
    find(:xpath, ta("Jul:venus:loginPage:orderHistory")).click
    #find(:xpath, ta('Jul:venus:loginPage:orderHistory', "//a[@id='ctl00_sidebarNav_accountsidebar1_hypOrderHistory']")).click
    #find(:xpath, "//a[@id='ctl00_sidebarNav_accountsidebar1_hypOrderHistory']").click

    sleep 10
  end
end
