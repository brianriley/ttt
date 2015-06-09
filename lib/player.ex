defmodule Player do
  def get_computer_move(board) do
    :random.seed(:os.timestamp)
    Board.empty_cells(board) |> Enum.shuffle |> List.first
  end
end
