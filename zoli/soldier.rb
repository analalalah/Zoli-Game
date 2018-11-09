
class Soldier
  attr_accessor :life, :id

  def initialize(i)
    @life = 3 
    @id = i   
  end

  def is_dead
    self.life == 0

  end

#   def life
#     if self.is_dead
#       "x"
    
#   @life
#   end
# end
  

end
    
