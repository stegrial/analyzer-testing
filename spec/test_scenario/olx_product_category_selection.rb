require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'OLX product category selection' do
    visit 'https://www.olx.ua/'

    sleep 2
     #find(ta('Jul:olx:main_page:animalCategory')).click
     #find(:xpath, "//span[@class='cat-icon cat-icon-circle cat-icon-35']").click
     find(:xpath, ta('Jul:olx:main_page:animalCategory', "//span[@class='cat-icon cat-icon-circle cat-icon-35']")).click

    sleep 2
     #find(:xpath, "//a[@data-id='1520']").click
     #find(ta('Jul:olx:main_page:free_animal_mating')).click
     find(:xpath, ta('Jul:olx:main_page:free_animal_mating', "//a[@data-id='1520']")).click

    sleep 2
     #find(:xpath, "//a[@data-cy='galleryWide']").click
     #find(ta('Jul:olx:product_page:gallery_view')).click
     #find(:xpath, ta('Jul:olx:product_page:gallery_view', "//span[@data-cy='galleryWide']")).click
     find(:xpath, ta('Jul:olx:product_page:gallery_view', "//a[@class='topTabView link']")).click

    sleep 3
     #find(:xpath, "//li[@class='wrap tleft rel fleft ad_idD2oWo ']").click
     #find(ta('Jul:olx:product_page:product')).click
     find(:xpath, ta('Jul:olx:product_page:product', "//ul[@class='gallerywide clr normal ']/li[12]")).click

    sleep 3
  end
end
