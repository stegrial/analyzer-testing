require 'capybara/rspec'
require 'selenium-webdriver'

module PathCheck

  def check_element_path(key, ta_locator, initial_locator)
    ta_path = find(ta(ta_locator)).path
    p ta_path

    case key
      when :css then initial_path = find(:css, initial_locator).path
      when :id then initial_path = find(:id, initial_locator).path
      when :xpath then initial_path = find(:xpath, initial_locator).path
      else p 'Selector type is not set, should be one of :css, :id, :xpath'
    end
    p initial_path

    expect(ta_path).to eq initial_path
  end

end