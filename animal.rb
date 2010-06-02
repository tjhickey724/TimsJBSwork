# written by Tim Hickey Monday 5/30/2010 7:38 pm

class AnimalTree 
  attr_accessor :name, :question, :yes, :no
  def initialize(theName)
    @name = theName
  end
end

class AnimalGame 
  attr_accessor :animalTree
  def initialize(a)
    @animalTree = AnimalTree.new(a)
  end

  # this starts the game
  def go 
    puts "Lets play the Animal Game!\n"    
    puts "You think of an animal, and I'll try to guess what you're thinking of.\nHit return when you are ready.\n\n"
    ans = gets.chomp
    play(@animalTree)
  end

  def play(t)

   if t.question==nil
      guess(t)
   else
      puts t.question
      answer=gets.chomp
      if answer=="yes"
        play(t.yes)
      else
        play(t.no)
      end
   end
  end

  def guess(t)
    puts "Is it a #{t.name}?"
    answer = gets.chomp
    if answer.chomp=="yes"
      puts "Yay! I won!!!"
      playagain
    else 
      puts "What animal were you thinking of?"
      animal = gets.chomp
      puts "Give me a yes/no question which is true for #{animal} but false for #{t.name}"
      q = gets.chomp
      puts "Thanks! I'll use that question next time someone narrows it down to this point!"
      puts "\n\n\n\n"
      t.question=q
      t.yes = AnimalTree.new(animal)
      t.no =  AnimalTree.new(t.name)
      playagain
    end
  end
  
  # this is for debugging, it prints the tree t with an indent of n spaces
  def printtree(n, t)
    if t.question==nil
      n.times {print " "}
      puts t.name
    else
      puts t.question
      printtree n+1, t.yes
      printtree n+1, t.no
    end
  end

  # this asks if the user wants to play again, and if so starts a new game
  def playagain
    puts "\n\n\n\nDo you want to play again? (yes or no)"
    ans = gets.chomp
    if ans=="yes"
       play @animalTree
    else
       puts "Nice playing with you!"
    end
  end

end

g = AnimalGame.new("zebra")
g.go
