require 'capybara/rspec'
require_relative './element_search_validation'

class GetCurrentUrl
  include Capybara::DSL
  include RSpec::Matchers
  include ElementSearchValidation

  def initialize
    @current_url = page.current_url
  end

  def save
    begin
      unless File.exist?(define_last_request + '/current_url.txt')
        file = File.new(define_last_request + '/current_url.txt', "w")
        file.puts @current_url
        file.close
      end
    rescue StandardError => ex
      puts ex
      puts "\n" + "\e[33m!log variables are not set\e[0m"
    end
  end

end