require 'spec_helper'

feature 'AT-132 thetiebar - cotton checkbox' do

  scenario 'Recording IL', il: true do

     visit 'https://www.thetiebar.com/'
     sleep 3
       find(:xpath, "//button//span[text()='Skinny Ties']").click
       find(:xpath,  "//h6[text()='Color']").click
       find(:xpath, ta('thetiebar:skinnyCottonTies', "//a[@title='Cotton Skinny Ties']")).click
  end

  scenario 'Searching IL', il: true do

    visit 'https://www.thetiebar.com/'
    sleep 3
       find(:xpath, "//button//span[text()='Skinny Ties']").click
       find(:xpath,  "//h6[text()='Color']").click
       find(:xpath, ta('thetiebar:skinnyCottonTies', "//a[@title='Cotton Skinny Ties']")).click
  end

end