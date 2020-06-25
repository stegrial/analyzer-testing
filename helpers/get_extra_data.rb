require 'capybara/rspec'
require_relative './element_search_validation'

class GetExtraData
  include Capybara::DSL
  include RSpec::Matchers
  include ElementSearchValidation

  def initialize(current_locator)
    script = File.read('./helpers/help-functions/get_href.js')
    @current_href = page.evaluate_script(script)
    @current_locator = current_locator
  end

  def save
    begin
      return if File.exist?(define_last_request + '/current_url.txt')
      return if File.exist?(define_last_request + '/current_locator.txt')

      file_href = File.new(define_last_request + '/current_href.txt', "w")
      file_href.puts @current_href
      file_href.close

      file_locator = File.new(define_last_request + '/current_locator.json', "w")
      file_locator.puts @current_locator.to_json
      file_locator.close
    rescue StandardError => ex
      puts ex
      puts "\n" + "\e[33m!log variables not set\e[0m"
    end
  end

end