defmodule Factors do
  use Application
  @moduledoc """
  Documentation for `Factors`.
  """


  def run(args) do
    {opts,_,_}= OptionParser.parse(args, [switches: [multiplication: :boolean]])
    IO.inspect opts, label: "Command Line Arguments"
    IO.puts "Starting the 'find the factors of an integer' app!'"
    first = List.first(args)
    {user_int, _remainder} = unless first do
      Integer.parse(IO.gets "Please input your integer:")
    else
      Integer.parse(first)
    end
    if opts[:multiplication] do
      multiples_of(user_int)
      |> Enum.with_index
      |> Enum.each(fn({x, i}) ->
        IO.puts "#{user_int} x #{i + 1} = #{x}"
      end)
    else
      IO.inspect factors(user_int)
    end
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

  @doc """
  Multiples of a number up to 10.

  ## Examples

      iex> Factors.multiples_of(4)
      [4, 8, 12, 16, 20, 24, 28, 32, 36, 40]

  """
  def multiples_of(i) do
    Enum.map(1..10, fn x -> x * i end)
  end

end
