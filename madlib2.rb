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
  n=x.length
  a = x[2..n-3].split(":")
  tag=a[0]
  desc=a[1]
  val=d[tag]
  if desc==nil
    return queryFor tag
  elsif val==nil
    return (d[tag]=queryFor desc)
  else
    return val
  end
end


x= "I think ((z: a person)) is ((an adjective)), right ((z))"
y = madlib x
puts "\n\n\n"
puts y


