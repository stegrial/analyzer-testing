require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do

  scenario 'Facebook new post' do
    visit 'https://www.facebook.com'

    find(:id, 'email').set('eshapovalov298@gmail.com')
    # find(ta('sign_in:email_field')).set('eshapovalov298@gmail.com')

    find(:id, 'pass').set('Tester1234')
    # find(ta('sign_in:pass_field')).set('Tester1234')

    find(:id, 'loginbutton').click
    # find(ta('sign_in:login_btn')).click

    find(:xpath, "//span[text()='Mark']").click
    # find(ta('home:profile')).click

    sleep 3 #wrong element without sleep

    expect(page).to have_selector(:xpath, "//img[@alt='your Profile Photo']", visible: true)
    # expect(page).to have_selector(:xpath, ta('profile:profilePhotoImg', "//img[@alt='your Profile Photo']"), visible: true)
    # expect(page).to have_selector(ta('profile:profilePhotoImg'), visible: true)

    find(:xpath, "//a[text()='Home']").click
    # find(:xpath, ta('profile:homeBtn', "//a[text()='Home']")).click
    # find(ta('profile:homeBtn')).click

    sleep 3 #wrong element without sleep

    expect(page).to have_selector(:xpath, "//div[@id='userNav']", visible: true)
    # expect(page).to have_selector(:xpath, ta('home:userNavBtn', "//div[@id='userNav']"), visible: true)
    # expect(page).to have_selector(ta('home:userNavBtn'), visible: true)

    find(:xpath, "//textarea[@name='xhpc_message']").click
    # find(:xpath, ta('home:postBox', "//textarea[@name='xhpc_message']")).click
    # find(ta('home:postBox')).click

    #sleep
    expect(page).to have_selector(:xpath, "//div[@data-testid='status-attachment-mentions-input']", visible: true)
    # expect(page).to have_selector(:xpath, ta('home:post:presentation', "//div[@data-testid='status-attachment-mentions-input']"), visible: true)
    # expect(page).to have_selector(ta('home:post:presentation'), visible: true)

    find(:xpath, "//div[@data-testid='status-attachment-mentions-input']").set('Hello world')
    # find(:xpath, ta('home:post:presentation', "//div[@data-testid='status-attachment-mentions-input']")).set('Hello world')
    # find(ta('home:post:presentation')).set('Hello world')

    find(:xpath, "//button[@data-testid='react-composer-post-button']").click
    # find(:xpath, ta('home:post:sendPresentationBtn', "//button[@data-testid='react-composer-post-button']")).click
    # find(ta('home:post:sendPresentationBtn')).click

    expect(page).to have_selector(:xpath, "//p[text()='Hello world']", visible: true)
    # expect(page).to have_selector(:xpath, ta('home:presentTextHW', "//p[text()='Hello world']"), visible: true)
    # expect(page).to have_selector(ta('home:presentTextHW'), visible: true)

    find(:xpath, "(//a[@data-testid='post_chevron_button'])[1]").click
    # find(:xpath, ta('home:threePointsOptionsBtn', "(//a[@data-testid='post_chevron_button'])[1]")).click
    # find(ta('home:threePointsOptionsBtn')).click

    sleep 3

    find(:xpath, "//a[@data-feed-option-name='FeedDeleteOption']").click
    # find(:xpath, ta('home:postDeletion:deletePostLink', "//a[@data-feed-option-name='FeedDeleteOption']")).click
    # find(ta('home:postDeletion:deletePostLink')).click

    sleep 3

    # find(:xpath, "//button[text()='Delete']").click
    # find(:xpath, ta('home:postDeletion:deleteBtn', "//button[text()='Delete']")).click
    find(ta('home:postDeletion:deleteBtn')).click
    sleep 3
  end
end
