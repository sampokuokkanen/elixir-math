defmodule Factors do
  use Application
  @moduledoc """
  Documentation for `Factors`.
  """


  def run(args) do
    {opts,_,_}= OptionParser.parse(args, [switches: [multiplication: :boolean, kilomiles: :boolean]])
    IO.inspect opts, label: "Command Line Arguments"
    IO.puts "Starting the 'find the factors of an integer' app!'"
    first = List.first(args)
    {user_int, _remainder} = unless first do
      Integer.parse(IO.gets "Please input your integer:")
    else
      Integer.parse(first)
    end
    cond do
      opts[:multiplication] ->
        multiples_of(user_int)
        |> Enum.with_index
        |> Enum.each(fn({x, i}) ->
          IO.puts "#{user_int} x #{i + 1} = #{x}"
        end)
      opts[:kilomiles] ->
          value = IO.gets "Press enter for kilometers to miles, press any key and enter for miles to kilometers"
          if String.trim(value) == "" do
            IO.puts kilometers_to_miles(user_int)
          else
            IO.puts miles_to_kilometers(user_int)
          end
      true ->
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

  @doc """
  Kilometers to miles.

  ## Examples

      iex> Factors.kilometers_to_miles(2)
      1.243

  """
  def kilometers_to_miles(k) do
    Float.round(k / 1.609, 3)
  end

  @doc """
  Miles to kilometers.

  ## Examples

      iex> Factors.miles_to_kilometers(2)
      3.218

  """
  def miles_to_kilometers(m) do
    Float.round(m * 1.609, 3)
  end


end
