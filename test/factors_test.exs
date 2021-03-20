defmodule FactorsTest do
  use ExUnit.Case
  doctest Factors

  test "factor of 2 is 2" do
    assert Factors.factors(2) == [1, 2]
  end

  test "factors of 25 are 1, 5, and 25" do
    assert Factors.factors(25) == [1, 5, 25]
  end
end
