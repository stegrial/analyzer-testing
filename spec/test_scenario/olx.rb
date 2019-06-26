require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://www.olx.ua/'

    # My profile button click
    #find(:xpath, '//span[@data-cy="common_link_header_myaccount"]').click
    #find(:xpath, ta('olx:home:myaccount', '//span[@data-cy="common_link_header_myaccount"]')).click
    find(ta('p:olx:home:myaccount')).click
    sleep 3

    # Registration button click
    find(:id, 'register_tab').click
    sleep 3

    page.driver.go_back
    page.driver.go_back

    # search field
    fill_in 'headerSearch', with: 'iphone'

    find(:xpath, '//div[@id="autosuggest-div"]/ul/li[1]').click

    find(:xpath, '//span[@class="highlight-close"]').click

    find(:id, 'geo-suggestions-close').click

    # sleep 55
    #find(:xpath, '(//h3[@class="lheight22 margintop5"])[1]').click
    #find(:xpath, ta('p:olx:searchResult:firstResult', '(//h3[@class="lheight22 margintop5"])[1]')).click
    find(:xpath, ta('p:olx:searchResult:firstResult').click

    sleep 5

  end
end
