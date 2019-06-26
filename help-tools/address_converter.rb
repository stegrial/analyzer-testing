address = "/*[1]/*[2]/*[8]/*[2]/*[1]/*[2]/*[2]/*[1]/*[1]/*[8]"

  # array = address.split(".")
  # for i in array
  # print "/*[#{i.to_i + 1}]"
  # end

  array = address.split("/*[")
  for i in array
    next if i == array[0]
    print "#{(i[0...-1]).to_i - 1}."
  end