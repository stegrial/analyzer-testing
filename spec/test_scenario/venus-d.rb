require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
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

    #find(:xpath, ta("profileBtn")).click
    find(:xpath, ('/html[1]/body[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]')).click

    #find(:xpath, ta("emailFld")).set('qateam@moovweb.com')
    #find(:xpath, ta("emailFld", "//input[@placeholder='Email']")).set('qateam@moovweb.com')
    find(:xpath, ("//input[@placeholder='Email']")).set('qateam@moovweb.com')

    #find(:xpath, ta("passwordFld")).set('1234567s')
    #find(:xpath, ta("passwordFld","//input[@id='ctl00_Body1_loginpassword']")).set('1234567s')
    find(:xpath, ("//input[@id='ctl00_Body1_loginpassword']")).set('1234567s')

    # find(:xpath, ta("signIn")).click
    #find(:xpath, ta("signIn","//a[@id='ctl00_Body1_loginbutton']")).click
    find(:xpath, ("//a[@id='ctl00_Body1_loginbutton']")).click

    #find(:xpath, ta("profileBtn")).click
    find(:xpath, ("/html[1]/body[1]/form[1]/div[4]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/button[1]")).click


    #find(:xpath, ta("account_info")).click
    #find(:xpath, ta("account_info", "//div[6]//div[2]//ul[1]//li[1]")).click
    find(:xpath, ("//div[6]//div[2]//ul[1]//li[1]")).click

    #find(:xpath, ta("profileBtn")).click
    find(:xpath, ("/html[1]/body[1]/form[1]/div[4]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/button[1]")).click


    #find(:xpath, ta("wish_list", "//div[6]//div[2]//ul[1]//li[4]")).click
    find(:xpath, ("//div[6]//div[2]//ul[1]//li[4]")).click
    sleep 5

    # a = find(:xpath, ("(//button[@aria-label='Account'])[1]"))
    # puts a.path.downcase

    find(:xpath, ta("profileBtn")).click

    # #find(:xpath, ta("account_info","//div[6]//div[2]//ul[1]//li[1]")).click
    # find(:xpath, ("//div[6]//div[2]//ul[1]//li[1]")).click
    sleep 5
  end
end
