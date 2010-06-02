# madlibs 

def madlib(template)
 return template.scan(/\(\([\w\s]*\)\)|[\w\s]*/).collect {|x| lookup(x)}.to_s
end

def lookup(x)
  if (x[0..1]=="((")
    puts "Enter a word or phrase for #{x}"
    return gets.chomp
  else
    return x
  end
end


x= "I think ((a person)) is ((an adjective))"
y = madlib x
puts "\n\n\n"
puts y
puts "\n\n\n"

