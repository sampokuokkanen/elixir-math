defmodule Mix.Tasks.RunFactors do
  use Mix.Task

  @moduledoc """
  Run `Factors`.
  """

  def run(args) do
    Factors.run args
  end
end
