require 'spec_helper'

feature 'AT-133 thetiebar - color button' do

  scenario 'Recording IL', il: true do

     visit 'https://www.thetiebar.com/'
      find(:xpath, "//button//span[text()='Shirts']").click
      find(:xpath, ta('thetiebar:Color', "//h6[text()='Color']")).click
  end

  scenario 'Searching IL', il: true do

    visit 'https://www.thetiebar.com/'
    find(:xpath, "//button//span[text()='Shirts']").click
    find(:xpath, ta('thetiebar:Color', "//h6[text()='Color']")).click
  end

end