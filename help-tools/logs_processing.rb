require 'fileutils'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'uri'

class Logs

  def initialize
    @filter_array
  end

  def logs_root
    dir = __dir__.split("/")
    project_root = dir[0..dir.length-2].join("/")
    Dir[project_root + '/logs/*/*']
  end

  def modify_html
    # original_href = 'https://google.com'
    # visit original_href
    # sleep 5

    logs_root.each do |path|
      html = path + '/data.html'
      new_page = File.open(html) { |file| Nokogiri.HTML(file) }
      # new_page = Nokogiri.HTML(page.driver.browser.page_source)

      # head = new_page.search('head').first
      # current_url = URI.parse(page.current_url)

      current_url = 'https://ectest.trueautomation.io/flow/#login'
      current_url = URI.parse(current_url)

      FileUtils.mkdir path + '/data_files'

      styles = new_page.search('link', 'script', 'img').select { |style| style['rel'] == 'stylesheet' || style['src'] }
      # puts styles

      styles.each do |style|
        # href = style['href'] if style['href']
        # href = style['src'] if style['src']
        style['href'] ? href = style['href'] : href = style['src']


        unless href.start_with? 'data:text/css' || 'data:image/png'
          unless href.start_with? 'http'
            if href.start_with? '/'
              href = current_url.scheme + '://' + current_url.host + href
            else
              href = '/' + href unless current_url.path[-1] == '/'
              href = current_url.scheme + '://' + current_url.host + current_url.path + href
            end
          end

          begin
            puts href
            file_name = URI.parse(href).path.split('/').last
            # style_code = Net::HTTP.get(URI.parse(href))
            open(path + '/data_files/' + file_name, 'wb') do |file|
              file << open(href, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read
            end
          rescue StandardError => ex
            # open_new_window :tab
            # tab = page.driver.browser.window_handles
            # page.driver.browser.switch_to.window(tab.last)
            # visit href
            # style_code = page.driver.browser.page_source
            # page.driver.browser.close
            # page.driver.browser.switch_to.window(tab.first)

            puts "\n" + "\e[33m!href can be wrong: \e[0m" + href
            puts ex
          ensure
            # head << '<style>' + style_code + '</style>'
            style['href'] = 'data_files/' + file_name if style['href']
            style['src'] = 'data_files/' + file_name if style['src']
            puts style
          end
        end
      end

      file = File.new(html, "w")
      file.puts(new_page)
      file.close
    end
  end

  def rm_html_and_analyzer
    logs_root.each do |path|
      html = path + '/data.html'
      if File.exist?(html)
        FileUtils.rm html
      else
        FileUtils.rm_rf(path)
        puts path + ' REMOVED, analyzer request found'
      end
    end
  end

  def rename_undefined
    logs_root.each do |path|
      element_address = path + '/element_address.txt'
      if File.exist?(element_address) && File.read(element_address) == 'undefined'
        File.write(element_address, 'NOT_FOUND', mode: 'w')
      end
    end
  end

  def rm_invalid_tree
    logs_root.each do |path|
      data = path + '/data.json'
      if File.exist?(data) && File.read(data) == 'undefined'
        FileUtils.rm_rf(path)
        puts "\n" + "\e[33mREMOVED - invalid data.json: \e[0m" + path
      end
    end
  end

  def rm_json_data
    logs_root.each do |path|
      data = %w(/data.json /signature.json)
      data.each do |file|
        FileUtils.rm(path + file) if File.exist?(path + file)
      end
    end
  end

  def create_signature_sources
    logs_root.each do |path|
      file_names = { '/data.html' => '/signature.html',
                     '/data_files' => '/signature_files',
                     '/element_address.txt' => '/signature_address.txt' }
      file_names.each do |source, target|
        FileUtils.cp_r path + source, path + target if File.exist?(path + source)
      end
    end
  end

  def filter
    filter = {}
    path_array = logs_root.sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }
    path_array.each do |path|
      filter[path] = Dir[File.join(path, '*')].count { |file| File.file?(file) }
    end

    filter_array = []
    filter.each { |pair| filter_array << pair }
    @filter_array = filter_array
  end

  def rm_same_requests
    array_to_remove = []
    @filter_array.each_with_index do |value, index|
      if value[1] == 3 && @filter_array[index + 1][1] == 3 # to leave only last request
      # if value[1] == 3 && @filter_array[index - 1][1] == 3 && @filter_array[index + 1][1] == 3 # to leave first and last requests
        array_to_remove << value[0]
      end
    end

    puts array_to_remove
    FileUtils.rm_rf(array_to_remove)
  end

  # <<< The first version of signature movement: >>>
  #
  # new_array = []
  # filter.each { |pair| new_array << pair }
  #
  # new_array.each_with_index do |value, index|
  #   signature = "#{value[0]}/signature.json"
  #   if value[1] == 3 and new_array[index - 1][1] == 2 and new_array[index - 2][1] == 2
  #     FileUtils.cp(signature, new_array[index - 1][0])
  #     FileUtils.cp(signature, new_array[index - 2][0])
  #   elsif value[1] == 3 and new_array[index - 1][1] == 2
  #     FileUtils.cp(signature, new_array[index - 1][0])
  #   end
  # end

  def last_index
    @filter_array.length - 1
  end

  def move_signature(index)
    signature = @filter_array[index][0] + '/signature.json'
    if @filter_array[index - 1][1] == 3
      FileUtils.cp(signature, @filter_array[index - 1][0])
    end
    move_signature(index - 1) if index > 0
  end

  def move_signature_address(index)
    signature_address = @filter_array[index][0] + '/signature_address.txt'
    puts signature_address
    if @filter_array[index - 1][1] == 5
      puts @filter_array[index - 1][0] + '/signature_address.txt'
      FileUtils.cp(signature_address, @filter_array[index - 1][0] + '/signature_address.txt')
    end
    move_signature_address(index - 1) if index > 0
  end

  def rename_log_directories # to rename directories containing data
    path_array = Dir[@root + '/logs/20200129091902/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }
    i = 1
    path_array.each do |path|
      dir = path.split("/")
      new_path = dir[0..dir.length-2].join("/")
      FileUtils.mv path, "#{new_path}/Search-AT-141-#{i}"
      i += 1
    end
  end

  def remove_slashes
    a = ""
    puts a.gsub(/\\/, '')
  end

end

processing = Logs.new
processing.logs_root
# processing.rm_invalid_tree
#
# processing.filter
# processing.rm_same_requests
#
# processing.rename_undefined
#
# processing.modify_html
# processing.create_signature_sources

processing.filter
processing.move_signature_address(processing.last_index)

# processing.rm_json_data

