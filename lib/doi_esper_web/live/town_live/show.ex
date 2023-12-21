defmodule DoiEsperWeb.TownLive.Show do
  use DoiEsperWeb, :live_view

  alias DoiEsperWeb.TownData

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:stream, Streams.get_stream!(id))}
  end

  defp page_title(:show), do: "Show Town"
  defp page_title(:edit), do: "Edit Town"
end
