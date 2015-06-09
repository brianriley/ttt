defmodule Ttt do
  @players [&Ttt.get_human_move/1, &Player.get_computer_move/1]

  def main do
    welcome
    run(Board.empty)
  end

  def welcome do
    IO.puts "Welcome to Tic Tac Toe!"
  end

  def run(board, is_full \\ false, winner \\ nil, players \\ @players)
  def run(board, _, _, []) do
    run(board, Board.is_full?(board), Judge.winner(board), @players)
  end
  def run(board, false, nil, players) do
    draw(board)
    move = hd(players).(board)
    player_index = Enum.find_index(@players, fn(player) -> player == hd(players) end)
    case Board.update(board, move, player_index+1) do
      {:ok, board} ->
        run(board, Board.is_full?(board), Judge.winner(board), tl(players))
      {:error, board} ->
        announce_invalid
        run(board, Board.is_full?(board), Judge.winner(board), players)
    end
  end
  def run(board, true, nil, _) do
    announce_draw(board)
  end
  def run(board, false, winner, _) do
    announce_winner(board, winner)
  end
  def run(board, true, winner, _) do
    announce_winner(board, winner)
  end

  def draw(board) do
    BoardView.show(board)
    |> Enum.each(&IO.puts/1)
    IO.puts ""
  end

  def get_human_move(_) do
    IO.write "What is your move (1-9)? "
    case IO.read(:line) |> String.strip |> Integer.parse do
      {move, _} ->
        move - 1
      :error ->
        announce_invalid
        get_human_move(nil)
    end
  end

  def announce_invalid do
    IO.puts "Invalid move"
  end

  def announce_draw(board) do
    draw(board)
    IO.puts "The game is a draw!"
  end

  def announce_winner(board, winner) do
    draw(board)
    IO.puts "We have a winner! Congratulations #{PlayerView.show(winner)}"
  end
end
