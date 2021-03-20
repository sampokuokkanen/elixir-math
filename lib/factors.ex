defmodule Factors do
  use Application
  @moduledoc """
  Documentation for `Factors`.
  """


  def run(_args) do
    IO.puts "Starting the 'find the factors of an integer' app!'"
    {user_int, _remainder} = Integer.parse(IO.gets "Please input your integer:")
    IO.inspect factors(user_int)
  end

  @doc """
  Find the factors of an integer

  ## Examples

      iex> Factors.factors(2)
      [1, 2]

  """
  def factors(i) do
    Enum.reject(1..i, fn x -> rem(i, x) != 0 end)
  end
end
