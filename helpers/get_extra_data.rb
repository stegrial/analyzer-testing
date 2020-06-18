require 'capybara/rspec'
require_relative './element_search_validation'

class GetExtraData
  include Capybara::DSL
  include RSpec::Matchers
  include ElementSearchValidation

  def initialize(current_locator)
    @current_url = page.current_url
    @current_locator = current_locator
  end

  def save
    begin
      return if File.exist?(define_last_request + '/current_url.txt')
      return if File.exist?(define_last_request + '/current_locator.txt')
      file_url = File.new(define_last_request + '/current_url.txt', "w")
      file_url.puts @current_url
      file_url.close
      file_locator = File.new(define_last_request + '/current_locator.json', "w")
      file_locator.puts @current_locator.to_json
      file_locator.close
    rescue StandardError => ex
      puts ex
      puts "\n" + "\e[33m!log variables not set\e[0m"
    end
  end

end