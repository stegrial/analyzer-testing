require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Walmart - adding product to cart' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
    end

    visit 'https://www.walmart.com/'
    sleep 3

    find(:xpath, ta(   "Jul:walmart:mainPage:sandwichBtn")).click
    #find(:xpath, ta('Jul:walmart:mainPage:sandwichBtn', "//span[@class='vhf-icn vhf-icn-menu vhf-icn-24']")).click
    #find(:xpath, "//span[@class='vhf-icn vhf-icn-menu vhf-icn-24']").click

    find(:xpath, ta(   "Jul:walmart:mainPage:baby")).click
    #find(:xpath, ta('Jul:walmart:mainPage:baby', "(//button[@class='a2FBJg oZMQT vh-category-button lyV0k'])[6]")).click
    #find(:xpath, "(//button[@class='a2FBJg oZMQT vh-category-button lyV0k'])[6]").click

    find(:xpath, ta(   'Jul:walmart:mainPage:feeding')).click
    #find(:xpath, ta('Jul:walmart:mainPage:feeding', "//span[text()='Feeding']")).click
    #find(:xpath, "//span[text()='Feeding']").click

    find(:xpath, ta(   'Jul:walmart:mainPage:babyFood')).click
    #find(:xpath, ta('Jul:walmart:mainPage:babyFood', "//a[@data-dept-id='dept-nav-id-nI1T-8Dr']")).click
    #find(:xpath, "//a[@data-dept-id='dept-nav-id-nI1T-8Dr']").click

    find(:xpath, ta(   'Jul:walmart:prodPage:gerberImg')).click
    #find(:xpath, ta('Jul:walmart:prodPage:gerberImg', "//img[@id='Gerber']")).click
    #find(:xpath, "//img[@id='Gerber']").click

    find(:xpath, ta(   'Jul:walmart:prodPage:addToCart')).click
    #find(:xpath, ta('Jul:walmart:prodPage:addToCart', "(//div[@class='easy-reorder easy-reorder-add'])[2]")).click
    #find(:xpath, "(//div[@class='easy-reorder easy-reorder-add'])[2]").click

    find(:xpath, ta(   "Jul:walmart:mainPage:sandwichBtn")).click

    sleep 5
  end
end
