require 'spec_helper'
require_relative '../helpers/special_methods'

def check_element_path(locator_type, ta_locator, initial_locator)
  ta_path = find(ta(ta_locator), visible: false).path

  dir = __dir__.split("/")
  root = dir[0..dir.length-2].join("/")
  current_test = Dir[root + '/logs/*/*'].sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }.last

  test = DataControl.new(current_test)
  test.check_request
  test.result

  puts ta_path

  case locator_type
    when :css then initial_path = find(:css, initial_locator).path
    when :id then initial_path = find(:id, initial_locator).path
    when :xpath then initial_path = find(:xpath, initial_locator).path
    else p 'Selector type is not set, must be one of: :css, :id, :xpath'
  end
  puts initial_path

  expect(ta_path).to eq initial_path
end

def scroll_to_element(locator_type = nil, distance_or_locator)
  if distance_or_locator.is_a? Integer
    page.execute_script("window.scrollTo(0, #{parameter});")
  elsif distance_or_locator.is_a? String
    element = find(locator_type, parameter, visible: false)
    page.execute_script("arguments[0].scrollIntoView();", element)
  else
    counter = (1..100).to_a << 0
    counter.each do |i|
      page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/100});")
      sleep 0.01
    end
  end
end
