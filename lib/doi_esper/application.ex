defmodule DoiEsper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DoiEsperWeb.Telemetry,
      # Start the Ecto repository
      DoiEsper.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DoiEsper.PubSub},
      # Start Finch
      {Finch, name: DoiEsper.Finch},
      # Start the Endpoint (http/https)
      DoiEsperWeb.Endpoint,
      Supervisor.child_spec({DoiEsper.Servers.XmlServer,  [:xml_server, []]}, id: :xml_server),
      Supervisor.child_spec({DoiEsper.Servers.ApiServer,  [:api_server, []]}, id: :api_server)
      # Start a worker by calling: DoiEsper.Worker.start_link(arg)
      # {DoiEsper.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DoiEsper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DoiEsperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
