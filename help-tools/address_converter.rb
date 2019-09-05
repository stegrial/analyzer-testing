address = "0.1.1.0.0.1.0.0.1.0.1.0.0"

if address.include? '.'
  array = address.split(".")
  for i in array
    print "/*[#{i.to_i + 1}]"
  end

elsif address.include? '/*['
  array = address.split("/*[")
  array.delete_at(0)
  array.map! { |i| (i.delete(']')).to_i - 1 }
  array[1...-1].map! { |i| i.to_s + '.' }
  puts array.join('.')
else
  puts 'Element address is not valid!'
end
