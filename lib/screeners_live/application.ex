defmodule ScreenersLive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ScreenersLiveWeb.Telemetry,
      # Start the Ecto repository
      ScreenersLive.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ScreenersLive.PubSub},
      # Start Finch
      {Finch, name: ScreenersLive.Finch},
      # Start the Endpoint (http/https)
      ScreenersLiveWeb.Endpoint
      # Start a worker by calling: ScreenersLive.Worker.start_link(arg)
      # {ScreenersLive.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ScreenersLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScreenersLiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
