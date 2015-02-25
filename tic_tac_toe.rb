# Tic Tac Toe Assignment
# Author: Sriram Srinivasan
# Date: 25 Feb 2015

def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts " _________"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts " _________"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def return_empty_positions(board)
  board.keys.select { |position| board[position] == " " }
end

def player_moves(board)
  begin
    puts "Player's move"  
    puts "Pick an empty square between (1-9)"
    player_choice = gets.chomp.to_i
  end until board[player_choice] == ' ' # empty_positions(board).include?(position)
  board[player_choice] = "X"
end

def computer_moves(board)
  puts "Computer's move"
  computer_choice = return_empty_positions(board).sample  
  board[computer_choice] = "O"
end

def there_is_a_winner(board)
  winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_combinations.each do |winning_line|
    if board[winning_line[0]] == "X" and board[winning_line[1]] == "X" and board[winning_line[2]] == "X"
      return "Player"
    elsif board[winning_line[0]] == "O" and board[winning_line[1]] == "O" and board[winning_line[2]] == "O"
      return "Computer"
    end
  end
  return nil  
end

#The initialize board method from the live lesson
def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' ' }
  board
end

# Main Gameplay

#board = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 =>' '}
board = initialize_board
draw_board(board)

# Simple randomization routine to determine if player starts or computer starts
# If result of random draw is 0, player starts. Player is always "X"
move_flag = [0,1].sample

begin
  if move_flag == 0 
    player_moves(board)
    draw_board(board)
    move_flag = 1
  else
    computer_moves(board)
    draw_board(board)
    move_flag = 0
  end
  winner = there_is_a_winner(board) 
end until return_empty_positions(board).empty? || winner

if winner 
  puts "#{winner} won!"
else
  puts "No winner!"
end