defmodule GreetingTest do
  use ExUnit.Case

  describe "greet" do
    test "greeting greets friends" do
      assert Greeting.greet() == "Hello my friend!"
    end
  end
end
