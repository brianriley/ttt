defmodule BoardTest do
  use ExUnit.Case

  test "it creates an empty board with all 0s" do
    assert Board.empty == Tuple.duplicate(0, 9)
  end

  test "you can update an element at an index" do
    {:ok, board} = Board.empty |> Board.update(0, 1)

    assert tuple_size(board) == 9
    assert elem(board, 0) == 1
  end

  test "you cannot update an element in an already used spot" do
    {:ok, board1} = Board.empty
      |> Board.update(0, 1)
    {:error, board} = Board.update(board1, 0, 1)

    assert board == board1
  end

  test "you can get just the rows" do
    rows = Board.empty
      |> Board.rows

    assert length(rows) == 3
  end

  test "you can map a function to rows" do
    results = Board.empty
      |> Board.map(fn(x) -> x end)
    
    assert results == [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  test "an empty board should not be full" do
    board = Board.empty

    assert Board.is_full?(board) == false
  end

  test "a board with all non-default values should be full" do
    board = Board.empty
    {:ok, board} = Board.update(board, 0, 1)
    {:ok, board} = Board.update(board, 1, 1)
    {:ok, board} = Board.update(board, 2, 1)
    {:ok, board} = Board.update(board, 3, 1)
    {:ok, board} = Board.update(board, 4, 1)
    {:ok, board} = Board.update(board, 5, 1)
    {:ok, board} = Board.update(board, 6, 1)
    {:ok, board} = Board.update(board, 7, 1)
    {:ok, board} = Board.update(board, 8, 1)

    assert Board.is_full?(board) == true
  end

  test "it reports the all cells empty when the board is empty" do
    assert Board.empty_cells(Board.empty) == Enum.map(0..8, fn(x) -> x end)
  end

  test "it reports the empty cells of a non-empty board" do
    board = Board.empty
    {:ok, board} = Board.update(board, 0, 1)
    {:ok, board} = Board.update(board, 1, 1)
    {:ok, board} = Board.update(board, 2, 1)

    assert Board.empty_cells(board) == [3, 4, 5, 6, 7, 8]
  end
end
