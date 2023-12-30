defmodule DoiEsperWeb.PostgisComponents do
  use Phoenix.Component
  # alias Phoenix.LiveView.JS

  def postgis_card(assigns) do
    ~H"""
      <div class="relative flex">
        <div class="justify-self-start"><h4>PostGIS Data</h4></div>
        <%= if @postgis_data do %>
            <p><%= @postgis_data %></p>
        <% end %>
      </div>
    """
  end
end
