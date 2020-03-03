require 'fileutils'

class Logs

  def initialize
    @root
    @filter_array
  end

  def root
    dir = __dir__.split("/")
    root = dir[0..dir.length-2].join("/")
    @root = root
  end

  def rm_html_and_analyzer
    Dir[@root + '/logs/*/*'].each do |path|
      html = "#{path}/data.html"
      if File.exist?(html)
        FileUtils.rm html
      else
        FileUtils.rm_rf(path)
        puts path + ' REMOVED, analyzer request found'
      end
    end
  end

  def rename_undefined
    Dir[@root + '/logs/*/*'].each do |path|
      element_address = "#{path}/element_address.txt"
      if File.exist?(element_address) and File.read(element_address) == 'undefined'
        File.write(element_address, 'NOT_FOUND', mode: 'w')
      end
    end
  end

  def rm_invalid_tree
    Dir[@root + '/logs/*/*'].each do |path|
      data = "#{path}/data.json"
      if File.exist?(data) and File.read(data) == 'undefined'
        FileUtils.rm_rf(path)
        puts path + ' REMOVED, invalid data.json'
      end
    end
  end

  def filter
    filter = {}
    path_array = Dir[@root + '/logs/*/*'].sort_by { |a| [ a.scan(/\d+/)[-2].to_i, a.scan(/\d+/)[-1].to_i ] }
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
      if value[1] == 2 and @filter_array[index - 1][1] == 2 and @filter_array[index + 1][1] == 2
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
    signature = "#{@filter_array[index][0]}/signature.json"
    if @filter_array[index - 1][1] == 2
      FileUtils.cp(signature, @filter_array[index - 1][0])
    end
    move_signature(index - 1) if index > 0
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

processing.root
processing.rm_html_and_analyzer
processing.rename_undefined
processing.rm_invalid_tree
processing.filter
processing.rm_same_requests
processing.filter
processing.move_signature(processing.last_index)

# processing.rename_log_directories