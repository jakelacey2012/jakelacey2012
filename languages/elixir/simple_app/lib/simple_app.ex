defmodule SimpleApp do
  @moduledoc """
  This module is for handling requests
  """
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, Thing.sum())
  end

  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end
end
