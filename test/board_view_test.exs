defmodule BoardViewTest do
  use ExUnit.Case

  test "it creates the strings for a full board" do
    view = Board.empty |> BoardView.show

    assert view == [
      "   |   |   ", "   |   |   ", "   |   |   ",
      "-----------",
      "   |   |   ", "   |   |   ", "   |   |   ",
      "-----------",
      "   |   |   ", "   |   |   ", "   |   |   "
    ]
  end
end
