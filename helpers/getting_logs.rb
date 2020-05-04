require 'capybara/rspec'
require_relative '../helpers/element_search_validation'

class GetCurrentUrl
  include Capybara::DSL
  include RSpec::Matchers
  include ElementSearchValidation

  def initialize
    @current_url = page.current_url
  end

  def save
    # define_new_request.each do |dir|
      begin
        unless File.exist?(define_last_request + '/current_url.txt')
          file = File.new(define_last_request + '/current_url.txt', "w")
          file.puts @current_url
          file.close
        end
      rescue StandardError => ex
        puts ex
      end
    # end
  end
end