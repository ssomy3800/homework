class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    self.place_stones
    @player1 = name1 
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,index|
      if index != 6 && index != 13
        4.times {cup << :stone}
    end
    
  end

  def valid_move?(start_pos)
    if start_pos.between?(0, 5) && @cups[start_pos] > 0
      return true

    elsif start_pos.between?(7, 12) && @cups[start_pos] > 0
      return true
    else
      raise ArgumentError.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup  # Use #dup to make a copy of the array
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      # skip the other player's store
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx] == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup == 0 } || @cups[7..12].all? { |cup| cup == 0 }
  end

  def winner
    player1_point = @cups[6]
    player2_point = @cups[13]

    if player1_point == player2_point
      puts "tie!"
    elsif player1_point > player2_point 
      puts "player1 wins!"
    else
      puts "player2 wins!"
    end
  end
  end
end