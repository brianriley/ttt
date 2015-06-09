defmodule JudgeTest do
  use ExUnit.Case

  test "an empty board has no winner" do
    assert Judge.winner(Board.empty) == nil
  end

  test "a board with only one move does not have a winner" do
    {:ok, board} = Board.empty
      |> Board.update(0, 1)

    assert Judge.winner(board) == nil
  end

  test "a board with a winning combo has a winner" do
    {:ok, board} = Board.empty
    |> Board.update(0, 1)
    {:ok, board} = Board.update(board, 1, 1)
    {:ok, board} = Board.update(board, 2, 1)

    assert Judge.winner(board) == 1
  end

  test "a board with another winning combo has a winner" do
    {:ok, board} = Board.empty
      |> Board.update(0, 2)
    {:ok, board} = Board.update(board, 4, 2)
    {:ok, board} = Board.update(board, 8, 2)

    assert Judge.winner(board) == 2
  end
end
