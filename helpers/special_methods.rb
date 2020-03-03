require 'net/http'
require 'uri'

def step(name, *args)
  begin
    puts '-' + name
    yield(*args)
  rescue Exception => e
    raise e.message
  end
end

def project_root
  dir = __dir__.split("/")
  dir[0..dir.length-2].join("/")
end

def required_relative_all(path)
  Dir[project_root + path].each { |file| require_relative file }
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

def scroll_to_element(locator_type = nil, distance_or_locator)
  if distance_or_locator.is_a? Integer
    page.execute_script("window.scrollTo(0, #{distance_or_locator});")
  elsif distance_or_locator.is_a? String
    element = find(locator_type, distance_or_locator, visible: false)
    page.execute_script("arguments[0].scrollIntoView();", element)
  else
    counter = (1..100).to_a << 0
    counter.each do |i|
      page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/100});")
      sleep 0.01
    end
  end
end