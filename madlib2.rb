# madlibs

def madlib(template)
 # first we lookup the ((.....)) expressions
 libs = template.scan(/\(\([\w\s]*\)\)/)
 dict={}
 libs.each do |x|
   if dict[x]==nil
     puts "Enter a #{x}"
     ans=gets.chomp
     dict[x]=ans
   end
 end
 print "the dictionary is #{dict}"

 parsedTemplate = template.scan(/\(\([\w\s]*\)\)|[\w\s]*/)
 newTemplate = parsedTemplate.collect {|x| lookup(x,dict)}
 return newTemplate.to_s

end

def lookup(x,d)
  x.scan(':') collect
  if ((a=d[x])==nil)
    return x
  else
    return a
  end
end


x= "I think ((a person)) is ((an adjective))"
y = madlib x
puts "\n\n\n"
puts y


