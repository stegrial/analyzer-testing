require 'fileutils'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'uri'

class Logs

  def initialize
    @filter_array = []
  end

  def logs_root
    dir = __dir__.split("/")
    project_root = dir[0..dir.length - 2].join("/")
    Dir[project_root + '/logs/*/*']
  end

  def modify_html
    # original_href = 'https://google.com'
    # visit original_href
    # sleep 5

    logs_root.each do |path|
      data_html = path + '/data.html'
      new_data_html = File.open(data_html) {|file| Nokogiri.HTML(file)}
      # new_page = Nokogiri.HTML(page.driver.browser.page_source)

      # head = new_page.search('head').first
      # current_url = URI.parse(page.current_url)

      current_url = File.read(path + '/current_url.txt')
      current_url_parsed = URI.parse(current_url.chomp)
      FileUtils.mkdir path + '/data_files'

      styles = new_data_html.search('link', 'img').select {|style| style['rel'] == 'stylesheet' || style['src']}
      # puts styles

      styles.each do |style|
        href = style['href'] ? style['href'] : style['src']

        # anniesalke update
        # href = style['href'] if style['href']
        # href = style['data-yo-src'] if style['src'] && style['data-yo-src']
        # href = style['src'] if style['src'] && style['data-yo-src'] == nil


        unless href.start_with?('data:text/css') || href.start_with?(/^\s*data:image\//) || href == ''
          # Used to be `data:image/png` || add new exception `href == ''`

          unless href.start_with? 'http'
            if (href.start_with? '/') && (href[1] != '/')
              href = current_url_parsed.scheme + '://' + current_url_parsed.host + href
            elsif href.start_with? '..'
              css_array = href.split('/')
              i = css_array.count {|url_part| url_part == '..'}
              i.times {css_array.shift}

              url_array = current_url.split('/')
              (i + 1).times {url_array.pop}

              url_array = url_array.concat(css_array)
              href = url_array.join('/')
            elsif href.start_with? '//'
              href = current_url_parsed.scheme + ':' + href
            else
              href = '/' + href unless current_url_parsed.path[-1] == '/'
              href = current_url_parsed.scheme + '://' + current_url_parsed.host + current_url_parsed.path + href
            end
          end

          begin
            puts href
            file_name = URI.parse(href).path.split('/').last
            # style_code = Net::HTTP.get(URI.parse(href))

            # anniesalke update
            # href = URI.escape(href) if href.include?(' ')
            # file_name = URI.parse(href).path.split('/').last
            # file_name = URI.unescape(file_name)

            open(path + '/data_files/' + file_name, 'wb') do |file|
              file << open(href, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
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
          end
        end
      end

      file = File.new(data_html, "w")
      file.puts(new_data_html)
      file.close
    end
  end

  def create_signature_sources
    logs_root.each do |path|
      file_names = {'/data.html' => '/signature.html',
                    '/data_files' => '/signature_files',
                    '/element_address.txt' => '/signature_address.txt'}
      file_names.each do |source, target|
        FileUtils.cp_r path + source, path + target if File.exist?(path + source)
      end

      signature_html = path + '/signature.html'
      new_signature_html = File.open(signature_html) {|file| Nokogiri.HTML(file)}
      styles = new_signature_html.search('link', 'img').select {|style| style['rel'] == 'stylesheet' || style['src']}

      styles.each do |style|
        href = style['href'] ? style['href'] : style['src']
        unless href.start_with?('data:text/css') || href.start_with?(/^\s*data:image\//) || href == '' # add exception
          style['href'] = 'signature_files/' + style['href'].split('/').last if style['href']
          style['src'] = 'signature_files/' + style['src'].split('/').last if style['src']
        end
      end

      file = File.new(signature_html, "w")
      file.puts(new_signature_html)
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

  def rm_analyzer
    logs_root.each do |path|
      probability = path + '/probability.txt'
      if File.exist?(probability)
        FileUtils.rm_rf(path)
        puts "\e[33mREMOVED - analyzer request found: \e[0m" + path
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
        puts "\e[33mREMOVED - invalid data.json: \e[0m" + path
      end
    end
  end

  def rm_no_current_url
    logs_root.each do |path|
      data = path + '/current_url.txt'
      unless File.exist?(data)
        FileUtils.rm_rf(path)
        puts "\e[33mREMOVED - current url is missing: \e[0m" + path
      end
    end
  end

  def rm_excess_data
    logs_root.each do |path|
      data = %w(/data.json /current_url.txt)
      data.each do |file|
        FileUtils.rm(path + file) if File.exist?(path + file)
      end
    end
  end

  # def filter
  #   filter = {}
  #   path_array = logs_root.sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }
  #   path_array.each do |path|
  #     filter[path] = Dir[File.join(path, '*')].count { |file| File.file?(file) }
  #   end
  #
  #   filter_array = []
  #   filter.each { |pair| filter_array << pair }
  #   @filter_array = filter_array
  # end

  def filter_array
    @filter_array = logs_root.
        sort_by {|a| [a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i]}.
        map {|path| [path, Dir[File.join(path, '*')].count {|file| File.file?(file)}]}
    self
  end

  def rm_same_requests
    array_to_remove = []
    @filter_array.each_with_index do |value, index|
      if value[1] == 4 && @filter_array[index + 1][1] == 4 # to leave only last request
        # if value[1] == 4 && @filter_array[index - 1][1] == 4 && @filter_array[index + 1][1] == 4 # to leave first and last requests
        array_to_remove << value[0]
      end
    end

    puts "\n" + "\e[33mSame Requests:\e[0m"
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

  def move_signature_data(index = last_index)
    data = %w(/signature.html /signature_files /signature_address.txt /signature.json)
    data.each do |object|
      signature_address = @filter_array[index][0] + object
      if @filter_array[index - 1][1] == 6
        puts "\e[33mMoving Signature Request: \e[0m" + @filter_array[index - 1][0] + object

        FileUtils.rm_rf(@filter_array[index - 1][0] + object)
        FileUtils.cp_r(signature_address, @filter_array[index - 1][0] + (object.include?('.') ? object : ''))
      end
    end
    move_signature_data(index - 1) if index > 0
  end

  def rename_log_directories # to rename directories containing data
    path_array = Dir[@root + '/logs/20200129091902/*'].sort_by {|a| a.scan(/\d+/)[-1].to_i}
    i = 1
    path_array.each do |path|
      dir = path.split("/")
      new_path = dir[0..dir.length - 2].join("/")
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
processing.rm_invalid_tree
processing.rm_analyzer
processing.rm_no_current_url

processing.filter_array.rm_same_requests

processing.rename_undefined

processing.modify_html
processing.create_signature_sources

processing.filter_array.move_signature_data

processing.rm_excess_data
