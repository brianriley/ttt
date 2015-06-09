defmodule Judge do
  def winning_combos do
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ]
  end

  def winner(board) do
    winners = winning_combos
      |> Enum.map(fn(combo) -> get_uniqs(combo, board) end)
      |> Enum.filter(fn(uniq_set) -> Enum.count(uniq_set) == 1 && (hd(uniq_set) != 0) end)
      |> List.flatten

    List.first(winners)
  end

  def get_uniqs(indexes, board) do
    indexes
      |> Enum.map(fn(index) -> elem(board, index) end)
      |> Enum.uniq
  end
end
