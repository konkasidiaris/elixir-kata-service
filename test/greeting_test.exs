defmodule GreetingTest do
  use ExUnit.Case

  describe "greet" do
    test "without arguments is generic" do
      assert Greeting.greet() == "Hello my friend!"
    end

    test "with nil is generic" do
      assert Greeting.greet(nil) == "Hello my friend!"
    end

    test "with name is personalised" do
      assert Greeting.greet("Richard") == "Hello Richard!"
    end
  end
end
