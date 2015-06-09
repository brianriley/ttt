defmodule Board do
  import Tuple, only: [duplicate: 2]

  def empty do
    duplicate(0, 9)
  end

  def update(board, index, element) when elem(board, index) == 0 do
    {:ok, board |> put_elem(index, element)}
  end
  def update(board, _, _) do
    {:error, board}
  end

  def rows(board, acc \\ [])
  def rows(board, acc) when is_tuple(board) do
    rows(Tuple.to_list(board), acc)
  end
  def rows([], acc), do: acc
  def rows(board, acc) do
    split = board |> Enum.split(3)
    rows(elem(split, 1), List.insert_at(acc, -1, elem(split, 0)))
  end

  def map(board, fun) do
    rows(board)
    |> Enum.map(fun)
  end

  def is_full?(board) when is_tuple(board) do
    is_full?(Tuple.to_list(board))
  end
  def is_full?(board) do
    Enum.all?(board, fn(x) -> x != 0 end)
  end

  def empty_cells(board) when is_tuple(board) do
    empty_cells(Tuple.to_list(board))
  end
  def empty_cells(board) do
    Enum.with_index(board)
    |> Enum.filter(fn(x) -> elem(x, 0) == 0 end)
    |> Enum.map(fn(x) -> elem(x, 1) end)
  end
end
