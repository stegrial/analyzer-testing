require 'capybara/rspec'
require 'selenium-webdriver'
require 'json'
require 'fileutils'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'uri'

class Logs
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @filter_array = []
    @files = []
  end

  def create_capybara_driver
    args = { args: %w(--disable-notifications --headless --disable-gpu --ignore-ssl-errors=yes --ignore-certificate-errors) }
    options = Selenium::WebDriver::Chrome::Options.new(args)

    Capybara.register_driver :chrome_driver do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end

    Capybara.configure do |capybara|
      capybara.run_server = false
      capybara.default_max_wait_time = 6
      capybara.default_driver = :chrome_driver
    end

    yield
    Capybara.current_session.driver.quit
  end

  def logs_root
    dir = __dir__.split("/")
    project_root = dir[0..dir.length - 2].join("/")
    Dir[project_root + '/logs/*/*']
  end

  def file_rename
    logs_root.each do |path|
      File.rename(path + '/current_href.txt', path + '/sources_href.txt') if File.exists?(path + '/current_href.txt')
    end
  end

  def filter_sources_href
    logs_root.each do |path|
      sources_href = File.read(path + '/sources_href.txt')
      filter_array = []
      sources_href.each_line { |href| filter_array << href }
      file = File.new(path + '/sources_href.txt', "w")
      file.puts(filter_array.uniq)
      file.close
    end
  end

  def get_sources_data
    create_capybara_driver do
      logs_root.each do |path|
        if File.exists?(path + '/sources_href.txt')

          FileUtils.mkdir path + '/data_files' unless Dir.exists?(path + '/data_files')
          sources_href = File.read(path + '/sources_href.txt')
          sources_href.each_line.with_index do |href, index|
            unless href.start_with?('data:text/css') || href.start_with?(/^\s*data:image\//) || href == ''
              begin
                puts href
                href = href.chomp
                old_href = href

                file_name = URI.parse(href).path.split('/').last
                ext_name = File.extname(file_name)
                new_href = 'data_files/file_name' + index.to_s + ext_name
                @files.push({
                  old_href: old_href,
                  new_href: new_href
                })

                # anniesalke update
                # href = URI.escape(href) if href.include?(' ')
                # file_name = URI.parse(href).path.split('/').last
                # file_name = URI.unescape(file_name)

                open(File.join(path, new_href), 'wb') do |file|
                  if File.extname(new_href) == '.css'
                    visit old_href

                    file << find('body')['innerText']
                    # css_content = find('body')['innerText']
                    # flag = false
                    # css_content.each_line do |line_content|
                    #   if line_content.include? '@import'
                    #     puts "Found in css file `@import`: #{line_content}"
                    #
                    #     css_path = line_content.slice(/[\w-]+\.css/)
                    #     puts "My css path #{css_path}"
                    #
                    #     ppath = old_href.gsub(/(?<=\/)[\w-]+\.css/, css_path)
                    #     puts "My css path #{ppath}"
                    #
                    #     final = line_content.gsub(/[\w-]+\.css/, ppath)
                    #     puts "My final path #{final}"
                    #     file << final
                    #     flag = true
                    #   end
                    # end
                    # file << css_content unless flag
                  else
                    file << open(old_href, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read
                  end
                end
              rescue StandardError => ex
                puts "\n" + "\e[31m!href can be wrong: \e[0m" + href
                puts ex
              end
            end
          end
          modify_html path
        else
          puts 'sources_href.txt not exist'
        end
      end
    end
  end

  def modify_html(path)
    # logs_root.each do |path|
      data_html = path + '/data.html'

      data = File.read(data_html)
      result = ''
      flag = false
      data.each_line do |line|
        flag = line.match(/<head\W/) if !flag
        if flag
          if line.index(/\/head>/).to_i == 0
            line = line.gsub(/<iframe.+?iframe>/, '')
            line = line.gsub(/<a.+?a>/, '')
          else
            line = line.gsub(/<iframe.+?iframe>/) do |iframe|
              Regexp.last_match.begin(0) < line.index(/\/head>/).to_i ? '' : iframe
            end
             line = line.gsub(/<a.+?a>/) do |a|
               Regexp.last_match.begin(0) < line.index(/\/head>/).to_i ? '' : a
             end
            flag = false
          end
        end
        result << line
      end

      # new_data_html = File.open(data_html) { |file| Nokogiri.HTML(file) }
      new_data_html = Nokogiri.HTML(result)

      head = new_data_html.search('head').first
      head.search("*").each do |node|
        node.remove unless %w(title style base link meta script noscript).include? node.name
      end

      # anniesalke update
      # broken_src = 'https://cdn-fsly.yottaa.net/582d2c4c32f01c22a2000001/599c8950b4440136e0f1123dfe2baf36.yottaa.net/v~4b.d2/js/jquery.fa-functions.js?yocs=D_G_J_'
      # broken_script = new_data_html.search('script').detect { |script| script['src'] == broken_src }
      # broken_script['src'] = ''

      scripts = new_data_html.search('script')
      scripts.each do |script|
        script['src'] = '' if script['src']
        script.content = ''
      end

      styles = new_data_html.search('link', 'img').select { |style| style['rel'] == 'stylesheet' || style['src'] }
      styles.each do |style|
        # puts styles
        href = style['href'] ? style['href'] : style['src']

        # anniesalke update
        # href = style['href'] if style['href']
        # href = style['data-yo-src'] if style['src'] && style['data-yo-src']
        # href = style['src'] if style['src'] && style['data-yo-src'] == nil

        unless href.start_with?('data:text/css') || href.start_with?(/^\s*data:image\//) || href == ''
          begin
            new_href = (@files.detect { |file| URI.unescape(file[:old_href]).include? href } || {}).dig(:new_href) || href
            #new_href = (@files.detect { |file| URI.unescape(file[:old_href]).match? href } || {}).dig(:new_href) || href

            # anniesalke update
            # href = URI.escape(href) if href.include?(' ')
            # file_name = URI.parse(href).path.split('/').last
            # file_name = URI.unescape(file_name)

            style['href'] = new_href if style['href']
            style['src'] = new_href if style['src']

            # unless href.start_with?('data:text/css') || href.start_with?(/^\s*data:image\//) || href == ''
            #
            #   unless href.start_with? 'http'
            #     if (href.start_with? '/') && (href[1] != '/')
            #       href = current_url_parsed.scheme + '://' + current_url_parsed.host + href
            #     elsif href.start_with? '..'
            #       css_array = href.split('/')
            #       i = css_array.count { |url_part| url_part == '..' }
            #       i.times { css_array.shift }
            #
            #       url_array = current_url.split('/')
            #       (i + 1).times { url_array.pop }
            #
            #       url_array = url_array.concat(css_array)
            #       href = url_array.join('/')
            #     elsif href.start_with? '//'
            #       href = current_url_parsed.scheme + ':' + href
            #     else
            #       href = '/' + href unless current_url_parsed.path[-1] == '/'
            #       href = current_url_parsed.scheme + '://' + current_url_parsed.host + current_url_parsed.path + href
            #     end
            #   end

            # style_code = Net::HTTP.get(URI.parse(href))
          rescue StandardError, InvalidURIError => ex
            puts "\n" + "\e[31m!href value is not modified: \e[0m" + href + ' in request: ' + path
            puts ex
          end
        end
      end

      file = File.new(data_html, "w")
      file.puts(new_data_html)
      file.close
      @files = []
    # end
  end

  def check_data_consistency
    create_capybara_driver do
      @filter_array.each_with_index do |value, index|
        puts "\n" + "\e[36m#{value[0]}\e[0m"
        html_path = value[0] + '/data.html'
        page.visit 'file://' + html_path

        relative_locator = JSON.parse(File.read(value[0] + '/current_locator.json'))
        begin
          if File.read(value[0] + '/element_address.txt') != 'NOT_FOUND'
            expected_path = find(relative_locator['type'].to_sym, relative_locator['value'], visible: false).path
            puts expected_path

            absolute_locator = []
            absolute_address = File.read(value[0] + '/element_address.txt').split(".")
            absolute_address.each do |i|
              i = "/*[#{i.to_i + 1}]"
              absolute_locator << i
            end
            absolute_locator = absolute_locator.join('')
            actual_path = find(:xpath, absolute_locator, visible: false).path
            puts actual_path

            expect(actual_path).to eq expected_path
          else
            expect(page).not_to have_selector(relative_locator['type'].to_sym, relative_locator['value'], visible: false)
            puts 'NOT_FOUND'
          end
        rescue RSpec::Expectations::ExpectationNotMetError, Capybara::ElementNotFound => ex
          puts ex
          puts "\e[33m!data is not consistency\e[0m"

          array_to_remove = []
          array_to_remove << value[0]
          if @filter_array[index - 1][1] == 'NOT_FOUND' && @filter_array[index - 2][1] == 'NOT_FOUND'
            array_to_remove << @filter_array[index - 1][0] if Dir.exists?(@filter_array[index - 1][0])
            array_to_remove << @filter_array[index - 2][0] if Dir.exists?(@filter_array[index - 2][0])
          elsif @filter_array[index - 1][1] == 'NOT_FOUND'
            array_to_remove << @filter_array[index - 1][0] if Dir.exists?(@filter_array[index - 1][0])
          end

          puts "\n" + "\e[33mRemoved requests:\e[0m"
          puts array_to_remove
          FileUtils.rm_rf(array_to_remove)
        end
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

      signature_html = path + '/signature.html'
      new_signature_html = File.open(signature_html) { |file| Nokogiri.HTML(file) }
      styles = new_signature_html.search('link', 'img').select { |style| style['rel'] == 'stylesheet' || style['src'] }

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

  def rm_no_href
    logs_root.each do |path|
      data = path + '/sources_href.txt'
      unless File.exist?(data)
        FileUtils.rm_rf(path)
        puts "\e[33mREMOVED - href is missing: \e[0m" + path
      end
    end
  end

  def rm_excess_data
    logs_root.each do |path|
      data = %w(/data.json /sources_href.txt /current_locator.json)
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
        sort_by { |a| [a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i] }.
        map { |path| [path, Dir[File.join(path, '*')].count { |file| File.file?(file) }] }
    @filter_array.each_index do |index|
      @filter_array[index][1] == 5 || @filter_array[index][1] == 7 ? @filter_array[index][1] = 'NOT_FOUND' : @filter_array[index][1] = 'FOUND'
    end
    self
  end

  def rm_same_requests
    array_to_remove = []
    @filter_array.each_with_index do |value, index|
      # if value[1] == 'NOT_FOUND' && @filter_array[index + 1][1] == 'NOT_FOUND' # to leave only last request
      if value[1] == 'NOT_FOUND' && @filter_array[index - 1][1] == 'NOT_FOUND' && @filter_array[index + 1][1] == 'NOT_FOUND' # to leave first and last requests
        array_to_remove << value[0]
      end
    end

    puts "\n" + "\e[33mSame Requests:\e[0m"
    puts array_to_remove
    FileUtils.rm_rf(array_to_remove)
  end

  def last_index
    @filter_array.length - 1
  end

  def move_signature_data(index = last_index)
    data = %w(/signature.html /signature_files /signature_address.txt /signature.json)
    data.each do |object|
      signature_address = @filter_array[index][0] + object
      if @filter_array[index - 1][1] == 'NOT_FOUND'
        puts "\e[33mMoving Signature Request: \e[0m" + @filter_array[index - 1][0] + object

        FileUtils.rm_rf(@filter_array[index - 1][0] + object)
        FileUtils.cp_r(signature_address, @filter_array[index - 1][0] + (object.include?('.') ? object : ''))
      end
    end
    move_signature_data(index - 1) if index > 0
  end

  def rename_log_directories # to rename directories containing data
    path_array = Dir[@root + '/logs/20200129091902/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }
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
processing.file_rename
processing.rm_invalid_tree
processing.rm_analyzer
processing.rm_no_href

processing.filter_array.rm_same_requests
processing.rename_undefined

processing.filter_sources_href
processing.get_sources_data

processing.filter_array.check_data_consistency
processing.create_signature_sources

processing.filter_array.move_signature_data

processing.rm_excess_data
