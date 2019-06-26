require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Clicking on the banner' do
    #recording and using (click) on the first banner on the main page
    #recording and using (click) on the third banner on the main page

    #Need to re-test when the banners names will be changed!

    visit 'https://venus-preprod.moovweb.net'

    # sleep 10
    # # find(:xpath, "(//a[@title='Shop Now'])[1]").click
    # find(:xpath, ta('venus:main:first_banner', "(//a[@title='Shop Now'])[1]")).click
    # # find(ta("venus:main:first_banner")).click
    #
    # sleep 10
    # # find(:xpath, "//a[./span[text()='Venus']]").click
    # find(:xpath, ta('venus:logo', "//a[./span[text()='Venus']]")).click
    # # find(ta("venus:logo")).click
    #
    # sleep 10
    # # find(:xpath, "(//a[@title='Shop Now'])[1]").click
    # find(:xpath, ta('venus:main:first_banner', "(//a[@title='Shop Now'])[1]")).click
    # # find(ta("venus:main:first_banner")).click

    #Need to run tests separately!

    # sleep 10
    # find(:xpath, "(//a[@title='Shop Now'])[3]").click
    find(:xpath, ta('venus:main:third_banner', "(//a[@title='Shop Now'])[3]")).click
    # find(ta("venus:main:third_banner")).click

    # sleep 10
    find(:xpath, "//a[./span[text()='Venus']]").click
    # find(:xpath, ta('venus:logo', "//a[./span[text()='Venus']]")).click
    # find(ta("venus:logo")).click

    # sleep 10
    # find(:xpath, "(//a[@title='Shop Now'])[3]").click
    find(:xpath, ta('venus:main:third_banner', "(//a[@title='Shop Now'])[3]")).click
    # find(ta("venus:main:third_banner")).click

    sleep 5
  end
end
