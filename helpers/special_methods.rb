require 'capybara/rspec'
require 'net/http'
require 'fileutils'
require 'uri'
require 'json'

def step(name, *args)
  begin
    puts '-' + name
    yield(*args)
  rescue Exception => e
    raise e.message
  end
end

def required_relative_all(path)
  dir = __dir__.split("/")
  root = dir[0..dir.length-2].join("/")
  Dir[root + path].each { |file| require_relative file }
end

def delete_saved_elements
  port_number = URI.parse(Capybara.current_session.driver.options[:url]).port
  base_url = "http://localhost:#{port_number}"
  url = URI("#{base_url}/clear_elements")

  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Delete.new(url)
  response = http.request(request)

  if response.code == 200.to_s
    puts "All elements were deleted"
  else
    puts "Elements can not be deleted"
    puts response.body
  end
end

def root
  dir = __dir__.split("/")
  dir[0..dir.length-2].join("/")
end

class DataControl
  include Capybara::DSL
  include RSpec::Matchers

  def initialize(dir)
    @data = JSON.parse(File.read(dir + "/data.json"))
    @signature = JSON.parse(File.read(dir + "/signature.json"))
    @element_address = File.read(dir + "/element_address.txt")
    @found_elements = 0
    @address
  end

  def check_request
    begin
      def search_1(page = @data, address = "0")
        if page["tag"] == @signature["tag"] &&
           page.dig("attributes", "id") == @signature["id"] &&
           page.dig("attributes", "class") == @signature["class"] &&
           page.dig("attributes", "value") == @signature["attrs"]["value"] &&
          (page["children"].find { |el| el["node_type"] == "Text" } || {}).dig("value") == @signature["text_value"]

          puts "Found #{address}, element address #{@element_address}"
          @found_elements += 1
          @address = address
        end
        page["children"].select { |el| el["node_type"] == "Element" }.each_with_index { |el, index| search_1(el, address + "." + index.to_s) }
      end

      def search_2(page = @data, address = "0")
        if page["tag"] == @signature["tag"] &&
           page.dig("attributes", "id") == @signature["id"] &&
           page.dig("attributes", "class") == @signature["class"] &&
           page.dig("attributes", "value") == @signature["attrs"]["value"]

          puts "Found #{address}, element address #{@element_address}"
          @found_elements += 1
          @address = address
        end
        page["children"].select { |el| el["node_type"] == "Element" }.each_with_index { |el, index| search_2(el, address + "." + index.to_s) }
      end

      def search_3(page = @data, address = "0")
        if page["tag"] == @signature["tag"] &&
           page.dig("attributes", "id") == @signature["id"] &&
           page.dig("attributes", "value") == @signature["attrs"]["value"] &&
          (page["children"].find { |el| el["node_type"] == "Text" } || {}).dig("value") == @signature["text_value"]

          puts "Found #{address}, element address #{@element_address}"
          @found_elements += 1
          @address = address
        end
        page["children"].select { |el| el["node_type"] == "Element" }.each_with_index { |el, index| search_3(el, address + "." + index.to_s) }
      end
      search_1
      search_2 if @found_elements == 0
      search_3 if @found_elements == 0
    rescue StandardError => e
      puts e
      puts element
    ensure
      @address = "NOT_FOUND" if @found_elements == 0
    end
  end

  def result
    begin
      return puts @address == @element_address ? "FOUND - EQUAL" : "FOUND - NOT EQUAL" if @found_elements == 1
      return puts "NOT FOUND" if @found_elements == 0
      return puts "UNDEFINED" if @found_elements > 1
    ensure
      expect(@address).to eq @element_address if @found_elements == 0 || @found_elements == 1
    end
  end
end

# <<< DataControl testing >>>

# data = ARGV[0] + "/data.json"
# signature = ARGV[0] + "/signature.json"
# address = ARGV[0] + "/element_address.txt"
# dir = root + "/logs/" + ARGV[0]
#
# test = DataControl.new(dir)
# test.check_request
# test.result

# <<< The version of DataControl after each step: >>>
#
# def check_responses
#   dir = __dir__.split("/")
#   root = dir[0..dir.length-2].join("/")
#
#   if $last_dir == 0
#     $current_test = Dir[root + '/logs/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }.last
#   end
#   responses = Dir[$current_test + '/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }.filter { |a| a.scan(/\d+/)[-1].to_i > $last_dir }
#   $last_dir = responses.last.scan(/\d+/)[-1].to_i
#   responses.each do |dir|
#     begin
#       test = DataControl.new(dir)
#       test.check_request
#       test.result
#     rescue StandardError => ex
#       puts ex
#     end
#   end
# end

module ExtendPage
  def post_processing(key)
    begin
      yield
    ensure
      unless key == :il
        dir = __dir__.split("/")
        root = dir[0..dir.length-2].join("/")
        current_test = Dir[root + '/logs/*/*'].sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }.last

        instance = DataControl.new(current_test)
        instance.check_request
        instance.result
      end
    end
  end
end