defmodule BoardView do
  def show(board) do
    Board.map(board, fn(row) -> show_row(row) end)
    |> Enum.intersperse("-----------")
    |> List.flatten
  end

  def show_row(row) do
    [
      "   |   |   ", 
      row
        |> Enum.map(&show_cell/1)
        |> Enum.join("|"),
      "   |   |   "
    ]
  end

  def show_cell(cell) do
    display = if cell == 0, do: " ", else: PlayerView.show(cell)
    " #{display} "
  end
end
