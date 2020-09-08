defmodule SimpleAppTest do
  use ExUnit.Case
  doctest SimpleApp

  @opts SimpleApp.init([])

  test "it returns pong" do
    conn = conn(:get, "/ping")

    conn = SimpleApp.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong!"
  end
end
