defmodule SkipperTest do
  use ExUnit.Case
  doctest Skipper

  test "greets the world" do
    assert Skipper.hello() == :world
  end
end
