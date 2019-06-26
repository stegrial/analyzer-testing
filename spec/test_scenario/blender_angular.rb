require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://www.blender.org'
    sleep 3

    # Navbar features click
    #find(:css, '#menu-item-58172').click
    #find(:css, ta('p:blender:home:features', '#menu-item-58172')).click
    find(:css, ta('p:blender:home:features')).click

    # Try blender experemental click
    find(:xpath, '//i[@class="fa fa-rocket"]').click
    #find(:xpath, ta('p:blender:home:features:try-blender-experemental', '//i[@class="fa fa-rocket"]')).click
    #find(:xpath, ta('p:blender:home:features:try_blender_experemental')).click

    # find(:xpath, "//div[@class='legend-toggle js-toggle-content']").click
    #find(:xpath, ta('p:blender:home:features:try_blender_experemental:legend',"//div[@class='legend-toggle js-toggle-content']")).click
    find(:xpath, ta('p:blender:home:features:try_blender_experemental:legend')).click

    sleep 3
  end

end
