defmodule FullAppWeb.PageController do
  use FullAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
