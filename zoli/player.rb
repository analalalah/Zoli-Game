require_relative 'soldier.rb' 

class Player
    
    attr_accessor :soldiers

    def initialize
        @soldiers = []
        3.times do |i|
            soldier = Soldier.new(i)
            @soldiers.push(soldier)
        end
    end

    def no_more_soldiers?
        @soldiers.size == 0
    end


end