
family={}
while line=gets
  entry=line.split(' ')
  x = entry[0] + " " + entry[1]
  family[x] = entry[2]
end

santa={}

def secretsanta(family,santa)
  givers= family.keys.to_a
  getters = family.keys.to_a


  while givers.length > 0
    n = givers.length
    if n==1
      # in this case we're done unless the last giver and getter are the same!
      a=givers[0]
      b=getters[0]
      santa[a]=b
      givers.delete(givers[0])
      getters.delete(getters[0])
      if a==b
        # Whoops!!! can't give to your self ... start over!!!
        secretsanta(family,santa)
      else
        #  DONE!
        return
      end
    else
      # pick a random person for the next giver to give to
      a=givers[0]
      x = rand(n)
      # don't let them give to themselves!
      while (b=getters[x])==a
         x=rand(n) 
      end
      # record who gives to whom and update the giver/getter lists
      santa[a]=b
      givers.delete(a)
      getters.delete(b)
    end
  end
end

s = secretsanta(family,santa)
#print "s.class = "
#puts s.class
#puts s
#puts santa
puts "\n ***** results *****"
santa.keys.each {|x| puts x + " gives to " + santa[x]}
puts " ***** results *****"

# I couldn't get the Pony gem to work ...
santa.keys.each  {|x| Pony.mail(:to => x[2], :from => 'tjhickey@brandeis.edu', :subject => 'secret santa', :body => "Send a present to "+x[0]+" "+x[1])}

