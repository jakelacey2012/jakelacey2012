defmodule ASDTest do
  use ExUnit.Case
  doctest ASD

  test "greets the world" do
    assert ASD.hello() == :world
  end
end
