class TicTacToe
  def initialize
    @board = [*1..9]
    @player = "X"
    until board_filled?() || victory?()
      display_board(@board)
      display_turn(@player)
      player_choice()
    end

  end

  private 

  def board_filled?
    filled = @board.all? { |element| element == "X" || element == "O" } 
    if filled
      display_board(@board)
      puts "Game over!"
      true
    else
      false
    end
  end

  def victory?
    check_elemnt = (@player == "X") ? "O" : "X"
    arr_to_check = Array.new(3, check_elemnt)
    check_row = false
    check_column = false
    check_cross = false
    3.times do |i|
      check_row = true if  @board[(3 * i)..(3 * i + 2)] == arr_to_check
      check_column = true if [@board[i], @board[i + 3], @board[i + 6]] == arr_to_check
    end
    check_cross = true if ([@board[0], @board[4], @board[8]] == arr_to_check) || ([@board[2], @board[4], @board[6]] == arr_to_check)
    if check_row || check_column || check_cross
      display_board(@board)
      puts "#{check_elemnt} won!"
      true
    else
      false
    end
  end

  def display_board(arr)
    puts "Tic Tac Toe"
    arr.each_with_index do |element, index|
      print " #{element} " if [0, 3, 6].any?(index)
      print "| #{element} |" if [1, 4, 7].any?(index)
      print " #{element} \n" if [2, 5, 8].any?(index)
    end
  end

  def display_turn(player)
    puts "#{player} turn"
  end

  def player_choice()
    print "Type in your choice: "
    num = gets.chomp.to_i
    @board[num - 1] = @player
    @player = (@player == "X") ? "O" : "X"
  end

end

game = TicTacToe.new()
