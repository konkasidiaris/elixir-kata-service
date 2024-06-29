defmodule GreetingWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts GreetingWeb.init([])

  describe "GET /greet" do
    test "return 'Hello my friend!'" do
      conn = conn(:get, "/greet")
      conn = GreetingWeb.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "Hello my friend!"
    end
  end

  describe "GET /greet?name=Joe" do
    test "return 'Hello Joe!'" do
      conn = conn(:get, "/greet?name=Joe")
      conn = GreetingWeb.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "Hello Joe!"
    end
  end
end
