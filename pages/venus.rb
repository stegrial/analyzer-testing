require 'capybara/rspec'
require 'selenium-webdriver'

module Sign_up

  def open_page(url)
    page.visit url
  end

  def click_element(ta_locator, element_locator)
    path = find(:xpath, ta(ta_locator, element_locator)).click.path
    p path

    element = find(:xpath, element_locator).path
    p element
    expect(path).to eq element
  # rescue
  #   path = find(:id, ta(ta_locator, element_locator)).path.click
  #   element = find(:id, element_locator).path
  #   expect(path).to eq element
  # rescue
  #   path = find(:css, ta(ta_locator, element_locator)).path.click
  #   element = find(:css, element_locator).path
  #   expect(path).to eq element
  end

  def fill_the_field(ta_locator, element_locator, value)
    find(:xpath, ta(ta_locator, element_locator)).set(value)
  end

  def press_button(ta_locator, button)
    click_button(ta(ta_locator, button))
  end

  def check_text_is_displayed(text)
    expect(page).to have_text(text)
  end




end