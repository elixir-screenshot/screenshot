defmodule Screenshot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ScreenshotWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Screenshot.PubSub},
      # Start the Endpoint (http/https)
      ScreenshotWeb.Endpoint
      # Start a worker by calling: Screenshot.Worker.start_link(arg)
      # {Screenshot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Screenshot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScreenshotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
