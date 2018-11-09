require_relative 'player.rb'
require_relative 'soldier.rb'

class Zoli

  def initialize
    @computer = Player.new
    @human = Player.new
  end
    
  def dice
    rand(1..6)
  end


  def situation
    print "                          Human        |     Computer\n"
    index = 0
    while index <= 2
      hi = (@human.soldiers[index].id+1).to_s unless @human.soldiers[index] == nil
      ci = (@computer.soldiers[index].id+1).to_s unless @computer.soldiers[index] == nil

      if @human.soldiers[index] != nil && @computer.soldiers[index] != nil
        print "                          S#{hi} - #{@human.soldiers[index].life}      <->      S#{ci} - #{@computer.soldiers[index].life}\n"     
      elsif @human.soldiers[index] != nil && @computer.soldiers[index] == nil
        print "                          S#{hi} - #{@human.soldiers[index].life}      <->      x\n"
      elsif @human.soldiers[index] == nil && @computer.soldiers[index] != nil
        print "                          x           <->      S#{ci} - #{@computer.soldiers[index].life}\n"
      end
      index += 1        
    end
  end

  def fight

    human_soldier = @human.soldiers[0]
    computer_soldier = @computer.soldiers[0]

    until human_soldier.is_dead || computer_soldier.is_dead
      print "press any key to dice: "
      hit = gets.chomp
      if hit
      computer_luck = dice    
      human_luck = dice
    
      print "   You diced #{human_luck}!                                            Computer diced #{computer_luck}!\n"
      if human_luck > computer_luck
        computer_soldier.life -= 1    
      elsif human_luck == computer_luck
        print "equality, dice again!\n\n"
        next
      else
        human_soldier.life -= 1
      end
      situation
      end
    end

    @human.soldiers.delete_if { |soldier| soldier.is_dead}
    @computer.soldiers.delete_if { |soldier| soldier.is_dead}

  end

  def start
    situation     
    while true
      fight
      if @human.no_more_soldiers?
        puts "you should be ashamed of yourself.."
        exit
      end
      if @computer.no_more_soldiers?
        puts "good job! You won the zoli game!"
        exit
      end    
    end
  end

end

z = Zoli.new
z.start