require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Clicking on profile dropdown after saving some profile data' do

    # The problem: TA does not find the element on the page as long as there is an notification
    # TA-732

    visit 'https://demo.vaadin.com/dashboard/#!dashboard'

    # sleep 5
    # find(:xpath, "//div[contains(., 'Username')]/input").set('tester')
    # find(:xpath, ta('vaadin:loginPage:username', "//div[contains(., 'Username')]/input")).set('tester')
    find(ta("vaadin:loginPage:username")).set('tester')

    #sleep 5
    # find(:xpath, "//div[contains(., 'Password')]/input").set('tester')
    # find(:xpath, ta('vaadin:loginPage:password', "//div[contains(., 'Password')]/input")).set('tester')
    find(ta("vaadin:loginPage:password")).set('tester')

    # sleep 5
    # find(:xpath, "(//div[@role='button'])[1]").click
    # find(:xpath, ta('vaadin:loginPage:loginBtn', "")).click
    find(ta("vaadin:loginPage:loginBtn")).click

    # sleep 5
    # find(:xpath, "").click
    # find(:xpath, ta('vaadin:loginPage:loginBtn', "")).click
    # find(ta("vaadin:notification:xBtn")).click

    #sleep 5
    # find(:css, "(//div[@id='dashboard-menu']//span)[1]").click
    # find(:xpath, ta('vaadin:mainPage:dropDownMenu', "(//div[@id='dashboard-menu']//span)[1]")).click
    find(ta("vaadin:mainPage:dropDownMenu")).click

    #sleep 5
    # find(:xpath, "//span[text()='Edit Profile']").click
    # find(:xpath, ta('vaadin:dropDownMenu:editProfile', "")).click
    find(ta("vaadin:dropDownMenu:editProfile")).click

    # sleep 5
    # find(:xpath, "(//input[@class='v-textfield v-widget'])[1]").set('Eugene')
    # find(:xpath, ta('vaadin:profileWindow:firstName', "")).set('Eugene')
    find(ta("vaadin:profileWindow:firstName")).set('Eugene')

    # sleep 5
    # find(:xpath, "(//input[@class='v-textfield v-widget'])[1]").set('Shapovalov')
    # find(:xpath, ta('vaadin:profileWindow:lastName', "")).set('Shapovalov')
    find(ta("vaadin:profileWindow:lastName")).set('Shapovalov')

    # sleep 5
    # find(:xpath, "(//div[@class='v-scrollable']//div[@role='button'])[4]").click
    # find(:xpath, ta('vaadin:profileWindow:okBtn', "")).click
    find(ta("vaadin:profileWindow:okBtn")).click

    # sleep 5
    # find(:css, "(//div[@id='dashboard-menu']//span)[1]").click
    # find(:xpath, ta('vaadin:mainPage:dropDownMenu', "(//div[@id='dashboard-menu']//span)[1]")).click
    find(ta("vaadin:mainPage:dropDownMenu")).click

    # sleep 5
    # find(:xpath, "//span[text()='Edit Profile']").click
    # find(:xpath, ta('vaadin:dropDownMenu:editProfile', "")).click
    find(ta("vaadin:dropDownMenu:editProfile")).click

    sleep 5
  end
end
