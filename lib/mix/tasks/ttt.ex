defmodule Mix.Tasks.Ttt do
  use Mix.Task

  @shortdoc "Play a game of Tic Tac Toe"

  @moduledoc "Play a game of Tic Tac Toe"

  def run(_) do
    Ttt.main
  end
end
