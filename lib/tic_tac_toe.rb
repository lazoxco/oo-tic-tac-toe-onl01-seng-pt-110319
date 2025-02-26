class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2],
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(input, token = "X") 
    @board[input] = token
  end
  
  def position_taken?(input)
    # @board[input] != " " ? true : false
    (@board[input] == "X") || (@board[input] == "O")
  end 
  
  def valid_move?(index)
    # @board[index] == " " ? true : false
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    # print "Enter a number from 1 - 9: "
    input = gets.chomp
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        win_combo
      else
        false
      end
    end 
  end 
  
  def full?
    @board.all?{|taken| taken != " "}
  end 
  
  def draw?
    !won? && full?
  end 
  
  def over?
    draw? || won? || full?
  end
  
  def winner 
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    end
  end 
  
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end 