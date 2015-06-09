defmodule PlayerViewTest do
  use ExUnit.Case

  test "it selects x for player 1" do
    assert PlayerView.show(1) == "x"
  end

  test "it selects o for player 2" do
    assert PlayerView.show(2) == "o"
  end
end
