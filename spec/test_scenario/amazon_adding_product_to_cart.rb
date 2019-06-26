require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do

  scenario 'Amazon:Add product to cart' do
    visit 'https://www.amazon.com/'

    find("option[value='search-alias=fashion-womens-intl-ship']").click

    # find(:xpath, "//input[@id='twotabsearchtextbox']").click
    # find(ta('Jul:amazon:searchCategory:input')).set("dress")
    find(:xpath, ta('Jul:amazon:searchCategory:input', "//input[@id='twotabsearchtextbox']")).set("dress")

    find(:xpath, ta('Jul:amazon:searchBtn', "//div/input[@value='Go']")).click
    # find(ta('Jul:amazon:searchBtn')).click
    # find(:xpath, "//div/input[@value='Go']").click

    find(:xpath, ta('Jul:amazon:searchResult:product', "(//img[@class='mediaCentralImage imageContainer__image'])[2]")).click
    # find(ta('Jul:amazon:searchResult:product')).click
    # find(:xpath, "(//img[@class='mediaCentralImage imageContainer__image'])[2]").click

    find(:xpath, ta('Jul:amazon:selectSize:sizeList', "//span[@class='twister-dropdown-highlight transparentTwisterDropdownBorder']")).click
    # find(:xpath, "//span[@class='twister-dropdown-highlight transparentTwisterDropdownBorder']").click
    # find(ta('Jul:amazon:selectSize:sizeList')).click

    find(:xpath, ta('Jul:amazon:selectSize:size', "(//li[@class='a-dropdown-item dropdownAvailable'])[3]")).click
    # find(:xpath, "(//a[@id='native_dropdown_selected_size_name_3']").click
    # find(ta('Jul:amazon:selectSize:size')).click

    find(:xpath, ta('Jul:amazon:addToCart', "//span[@id='submit.add-to-cart']")).click
    # find(ta('Jul:amazon:addToCart')).click
    # find(:xpath, "//span[@id='submit.add-to-cart']").click

    sleep 3
  end
end
