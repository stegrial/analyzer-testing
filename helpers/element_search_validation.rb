require 'json'
require_relative './special_methods'

module ElementSearchValidation
  class DataControl
    include Capybara::DSL
    include RSpec::Matchers

    def initialize(dir)
      @data = JSON.parse(File.read(dir + '/data.json'), max_nesting: 200)
      @signature = JSON.parse(File.read(dir + '/signature.json'))
      @element_address = File.read(dir + '/element_address.txt')
      @found_elements = 0
      @address
    end

    def search(page = @data, address = '0', condition)
      tag = page['tag'] == @signature['tag']
      # id = page.dig('attributes', 'id') == @signature['id']
      # class_attr = condition.include?('class') ? page.dig('attributes', 'class') == @signature['class'] : true
      value = page.dig('attributes', 'value') == @signature['attrs']['value']
      text_value = condition.include?('text_value') ? (page['children'].find { |el| el['node_type'] == 'Text' } || {}).dig('value') == @signature['text_value'] : true
      css = page.dig('css') == @signature.dig('css')

      # if tag && id && class_attr && value && text_value
      if tag && css && value && text_value
        puts "Found #{address}, element address #{@element_address}"
        @found_elements += 1
        @address = address
      end
      page['children'].select { |el| el['node_type'] == 'Element' }.each_with_index { |el, index| search(el, address + '.' + index.to_s, condition) }
      # puts page.dig('css') if address == '0.1.10.1.0.0.0.2.0.0.1.0.0.2.2.1'
    end

    def check_process
      begin
        # puts @signature.dig('css').sort.to_h
        search(@data, '0', %w(text_value))
        # search(@data, '0', %w(class text_value))
        # search(@data, '0', %w(class)) if @found_elements == 0
        # search(@data, '0', %w(text_value)) if @found_elements == 0
        search(@data, '0', %w(nothing)) if @found_elements == 0
      rescue StandardError => e
        puts e
        puts element
      ensure
        @address = "NOT_FOUND" if @found_elements == 0
      end
    end

    def result
      begin
        if @found_elements == 1
          puts @address == @element_address ? "FOUND - EQUAL" : "FOUND - NOT EQUAL"
          puts @address == @signature["addr"] ? "ELEMENT ADDRESS NOT CHANGED" : "ELEMENT ADDRESS CHANGED"
        end
        return puts "NOT FOUND" if @found_elements == 0
        return puts "UNDEFINED" if @found_elements > 1
      ensure
        expect(@element_address).to eq @address if @found_elements == 0 || @found_elements == 1
      end
    end
  end

  # <<< DataControl testing >>>
  # dir = project_root + "/logs/" + ARGV[0]
  #
  # test = DataControl.new(dir)
  # test.check_process
  # test.result

  # <<< Request definition: >>>
  def define_new_request
    current_test = Dir[project_root + '/logs/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }.last
    Dir[current_test + '/*'].sort_by { |a| a.scan(/\d+/)[-1].to_i }.select { |a| a.scan(/\d+/)[-1].to_i > $last_dir }
  end

  def save_last_request
    $last_dir = define_new_request.last.scan(/\d+/)[-1].to_i
  end

  def check_new_request
    define_new_request.each do |dir|
      begin
        if File.exist?(dir + '/signature.json')
          instance = DataControl.new(dir)
          instance.check_process
          instance.result
        end
      rescue StandardError => ex
        puts ex
      end
    end
  end

  def define_last_request
    Dir[project_root + '/logs/*/*'].sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }.last
  end

  def check_last_request
    begin
      if File.exist?(define_last_request + '/signature.json')
        instance = DataControl.new(define_last_request)
        instance.check_process
        instance.result
      end
    rescue StandardError => ex
      puts ex
    ensure
      return 'oh'
    end
  end

end