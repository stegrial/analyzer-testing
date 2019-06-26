require 'capybara/rspec'
require 'selenium-webdriver'

module PathCheck

  def check_element_path(ta_locator, initial_locator)
    ta_path = find(:xpath, ta(ta_locator)).path
    p ta_path

    initial_path = find(:xpath, initial_locator).path
    p initial_path

    expect(ta_path).to eq initial_path
  end

end