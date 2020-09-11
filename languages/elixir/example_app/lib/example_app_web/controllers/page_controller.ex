defmodule ExampleAppWeb.PageController do
  use ExampleAppWeb, :controller

  def index(conn, _params) do
    conn
      |> render("index.html")
  end
end
