defmodule TsOban.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TsObanWeb.Telemetry,
      TsOban.Repo,
      {Oban, Application.fetch_env!(:ts_oban, Oban)},
      {DNSCluster, query: Application.get_env(:ts_oban, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TsOban.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TsOban.Finch},
      # Start a worker by calling: TsOban.Worker.start_link(arg)
      # {TsOban.Worker, arg},
      # Start to serve requests, typically the last entry
      TsObanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TsOban.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TsObanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
