require 'net/http'
require 'fileutils'
require 'uri'

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

def remove_slashes
  a = ""
  puts a.gsub(/\\/, '')
end

# logs_processing