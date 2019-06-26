require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
    visit 'https://ru.aliexpress.com/'
    Capybara.current_session.driver.browser.manage.window.resize_to(1440, 900)

    # find(ta('p:aliexpres:home:customerSave')).send_keys:escape
    find(ta('p:aliexpres:home:customerSave')).click

    page.go_back

    find(ta('p:aliexpres:home:help')).hover
    sleep 2
    find(ta('p:aliexpres:home:customerGuide')).hover
    find(ta('p:aliexpres:home:disputesAndComplaints')).hover
    find(ta('p:aliexpres:home:reportCopyrightIinfringement')).hover

    find(ta('p:aliexpres:home:reportCopyrightIinfringement')).click

    page.go_back


    find(ta('p:aliexpres:home:saveInTheApp')).click
    sleep 1
    page.go_back

    find(ta('p:aliexpres:home:searchField')).set('ping-pong')
    sleep 1


    visit 'https://ru.aliexpress.com/'

    find(ta('p:aliexpres:home:categories:phones')).hover
    sleep 1
    find(ta('p:aliexpres:home:categories:computers')).hover
    find(ta('p:aliexpres:home:categories:electronics')).hover
    find(ta('p:aliexpres:home:categories:appliances')).hover
    find(ta('p:aliexpres:home:categories:clothesForWomen')).hover
    find(ta('p:aliexpres:home:categories:clothesForMan')).hover
    find(ta('p:aliexpres:home:categories:clothesForChildren')).hover
    find(ta('p:aliexpres:home:categories:watch')).hover

    sleep 5



  end
end
