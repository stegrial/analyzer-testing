require 'json'
require 'rspec'
require_relative './special_methods'

module ElementSearchValidation
  class DataControl
    include Capybara::DSL
    include RSpec::Expectations
    include RSpec::Matchers

    def initialize(dir)
      @data = JSON.parse(File.read(dir + '/data.json'), max_nesting: 200)
      @signature = JSON.parse(File.read(dir + '/signature.json'))
      @element_address = File.read(dir + '/element_address.txt')
      @found_elements = 0
      @count_elements = 0
      @found_address = {}
      @count_address = []
    end

    def search(page = @data, address = '0', condition)
      tag = page['tag'] == @signature['tag']
      css = condition.include?('css') ? page.dig('css') == @signature.dig('css') : true
      class_attr = condition.include?('class') ? page.dig('attributes', 'class') == @signature['class'] : true
      text_value = condition.include?('text_value') ? (page['children'].find { |el| el['node_type'] == 'Text' } || {}).dig('value') == @signature['text_value'] : true
      value = condition.include?('value') ? page.dig('attributes', 'value') == @signature['attrs']['value'] : true
      name = condition.include?('name') ? page.dig('attributes', 'name') == @signature['attrs']['name'] : true
      id = condition.include?('id') ? page.dig('attributes', 'id') == @signature['id'] : true

      if tag && css && class_attr && text_value && value && name && id
        @count_elements += 1
        @count_address << address
      end
      page['children'].select { |el| el['node_type'] == 'Element' }.each_with_index { |el, index| search(el, address + '.' + index.to_s, condition) }
      # puts page.dig('css') if address == '0.1.1.0.0.1.0.0.0.0.1.2'
    end

    def check_process
      begin
        # puts @signature.dig('css').sort.to_h

        args = %w(css class text_value value name id)
        loop do
          @count_elements = 0
          @count_address = []

          search(@data, '0', args)
          if @found_elements == 0 || (@found_elements > @count_elements && @count_elements > 0)
            @found_elements = @count_elements
            @found_address[@found_elements] = @count_address
          end
          args.pop
          break if @count_elements == 1 || args == []
        end
      rescue Exception => ex
        puts ex
      ensure
        puts 'Found check elements:' + "\n" + @found_address[@found_elements].join("\n"), 'analyzer address: ' + @element_address
        @found_address[@found_elements][0] = "NOT_FOUND" if @found_elements == 0
      end
    end

    def result
      begin
        if @found_elements == 1
          puts @found_address[@found_elements][0] == @element_address ? "ELEMENT FOUND, EQUAL" : "ELEMENT FOUND - NOT EQUAL"
          puts @found_address[@found_elements][0] == @signature["addr"] ? "ELEMENT ADDRESS NOT CHANGED" : "ELEMENT ADDRESS CHANGED"
        elsif @found_elements == 0
          puts "ELEMENT NOT FOUND"
        else
          puts "UNDEFINED RESULT"
        end
      ensure
        expect(@element_address).to eq @found_address[@found_elements][0] if @found_elements == 0 || @found_elements == 1
        expect(@found_address[@found_elements]).to include(@element_address),
'FOUND ELEMENT IS WRONG, right element has a coefficient lower than set threshold!' if @found_elements > 1
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
    rescue Exception => ex
      puts ex
    ensure
      return 'oh'
    end
  end

end