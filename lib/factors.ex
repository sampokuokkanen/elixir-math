defmodule Factors do
  use Application
  @moduledoc """
  Documentation for `Factors`.
  """


  def run(args) do
    IO.puts "Starting the 'find the factors of an integer' app!'"
    first = List.first(args)
    IO.inspect first
    {user_int, _remainder} = unless first do
      Integer.parse(IO.gets "Please input your integer:")
    else
      Integer.parse(first)
    end

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
