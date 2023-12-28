defmodule DoiEsperWeb.ImageComponents do
  use Phoenix.Component
  # alias Phoenix.LiveView.JS

  def image_card(assigns) do
    ~H"""
      <div class="relative flex">
        <div class="justify-self-start"><h4>Image Data</h4></div>
        <div class="justify-self-end"><span class="text-sm"><%= if @image_data && Enum.count(@image_data) > 0 do %>🟢<% else %>🔴<% end %></span></div>
        <%= if @image_data && Enum.count(@image_data) > 0 do %>
          <ul class="self-center">
            <li><%= String.capitalize(@image_data.name) %></li>
            <li><%= String.capitalize(@image_data.category) %></li>
            <li><%= String.capitalize(@image_data.group) %></li>
            <li><%= @image_data.unicode %></li>
          </ul>
        <% end %>
      </div>
    """
  end
end
