require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Main Page testing' do
    visit 'https://www.epicgames.com'

    #Epic games logo click
    find(:css, '.shieldLogo').click
    # find(:css, ta('p:epicgames:home:logo', '.shieldLogo')).click
    # find(ta('p:epicgames:home:logo')).click

    # Store button click
    find(:id, 'sitenav-link-0').click
    # find(:id, ta('p:epicgames:home:store', 'sitenav-link-0')).click
    # find(ta('p:epicgames:home:store')).click

    # News button click
    find(:id, 'sitenav-link-1').click
    # find(:id, ta('p:epicgames:home:news', 'sitenav-link-1')).click
    # find(ta('epicgames:home:news')).click

    # Help button click
    find(:id, 'sitenav-link-2').click
    # find(:id, ta('p:epicgames:home:help', 'sitenav-link-2')).click
    # find(ta('p:epicgames:home:help')).click

    # UnrealEngine button click
    find(:id, 'sitenav-link-3').click
    # find(:id, ta('p:epicgames:home:unrealEngine', 'sitenav-link-3')).click
    # find(ta('p:epicgames:home:unrealEngine')).click

    # First slider button click
    find(:xpath, '(//div[@class="slick-arrow slick-next"])[1]').click
    # find(:xpath, ta('p:epicgames:unrealEngine:firstSliderBtn', '(//div[@class="slick-arrow slick-next"])[1]')).click
    # find(ta('p:epicgames:unrealEngine:firstSliderBtn')).click

    # Second slider button click
    find(:xpath, '(//div[@class="slick-arrow slick-next"])[2]').click
    # find(:xpath, ta('p:epicgames:unrealEngine:secondSliderBtn', '(//div[@class="slick-arrow slick-next"])[2]')).click
    # find(ta('p:epicgames:unrealEngine:secondSliderBtn')).click

    # Third slider button click
    find(:xpath, '(//div[@class="slick-arrow slick-next"])[3]').click
    # find(:xpath, ta('p:epicgames:unrealEngine:thirdSliderBtn', '(//div[@class="slick-arrow slick-next"])[3]')).click
    # find(ta('p:epicgames:unrealEngine:thirdSliderBtn')).click

    # Latest news btn click
    find(:id, 'overviewRibbon').click
    # find(:id, ta('p:unrealEngine:home:latestnewsBtn', 'overviewRibbon')).click
    # find(ta('p:unrealEngine:home:latestnewsBtn')).click

    # Sign in btn click
    find(:xpath, '//span[@class="sign-text item-label display-name text-color"]').click
    # find(:xpath, ta('p:unrealEngine:home:signIn', '//span[@class="sign-text item-label display-name text-color"]')).click
    # find(ta('p:unrealEngine:home:signIn')).click

    # Sign up btn click
    find(:id, 'switchPageAction').click
    # find(:id, ta('p:unrealEngine:home:signUp', 'switchPageAction')).click
    # find(ta('p:unrealEngine:home:signUp')).click

    # Register button click
    find(:id, 'register').click # Can't click with id
    # find(:id, ta('p:unrealEngine:home:signUp:register', 'register')).click # Can't click with id
    # find(ta('p:unrealEngine:home:signUp:register')).click

    # Set name field
    find(:id, 'name').set('name')
    # find(:id, ta('p:unrealEngine:home:signUp:name', 'name')).set('name')
    # find(ta('p:unrealEngine:home:signUp:name')).set('name')

    # Set lastname field
    find(:id, 'lastName').set('lastName')
    # find(:id, ta('p:unrealEngine:home:signUp:lastName', 'lastName')).set('lastName')
    # find(ta('p:unrealEngine:home:signUp:lastName')).set('lastName')

    # Set displayname field
    find(:id, 'displayName').set('displayName')
    # find(:id, ta('p:unrealEngine:home:signUp:displayName', 'displayName')).set('displayName')
    # find(ta('p:unrealEngine:home:signUp:displayName')).set('displayName')

    # Set email field
    find(:id, 'email').set('email@mail.com')
    # find(:id, ta('p:unrealEngine:home:signUp:email', 'email')).set('email@mail.com')
    # find(ta('p:unrealEngine:home:signUp:email')).set('email@mail.com')

    # Set password field
    find(:id, 'password').set('Pas$w0rd!')
    # find(:id, ta('p:unrealEngine:home:signUp:password', 'password')).set('password')
    # find(ta('p:unrealEngine:home:signUp:password')).set('password')

    # Set checkbox news
    # find(:id, 'emailSubscribe').click # Can't click with id
    # find(:id, ta('p:unrealEngine:home:signUp:emailSubscribe', 'password')).click  # Can't click with id
    find(ta('p:unrealEngine:home:signUp:emailSubscribe')).click

    # Set checkbox termsAgree
    # find(:id, 'termsAgree').click # Can't click with id
    # find(:id, ta('p:unrealEngine:home:signUp:termsAgree', 'termsAgree')).click  # Can't click with id
    find(ta('p:unrealEngine:home:signUp:termsAgree')).click



    sleep 5

  end
end
