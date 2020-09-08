defmodule SimpleApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: SimpleApp.Worker.start_link(arg)
      # {SimpleApp.Worker, arg}
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: SimpleApp,
        options: [port: Application.get_env(:simple_app, :port)]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
