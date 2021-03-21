defmodule FactorsTest do
  use ExUnit.Case
  doctest Factors

  test "factor of 2 is 2" do
    assert Factors.factors(2) == [1, 2]
  end

  test "factors of 25 are 1, 5, and 25" do
    assert Factors.factors(25) == [1, 5, 25]
  end

  test "convert kilometers to miles" do
    assert Factors.kilometers_to_miles(1) == 0.622
  end

  test "convert miles to kilometers" do
    assert Factors.miles_to_kilometers(1) == 1.609
  end
  
end
