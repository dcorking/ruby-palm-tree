# testing an answer for http://stackoverflow.com/questions/25163039/make-a-battleship-game-in-ruby/25165810#25165810

blank_row = Array.new(10,false)
board = Array.new(10) { blank_row.clone }

board[2][3] = true
board[2][4] = true

board.each.with_index do |row, y|
  row.each.with_index do |v, x|
    # change a true cell to 'S' and false to '.'
    if v
      board[y][x] = 'S'
    else
      board[y][x] = '.'
    end
  end
end
