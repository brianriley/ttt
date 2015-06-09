defmodule PlayerTest do
  use ExUnit.Case

  test "it makes a move" do
    board = Board.empty

    assert Player.get_computer_move(board) > 0
  end
end
