defmodule DoiEsperWeb.DashboardComponents do
  use Phoenix.Component
  alias DoiEsperWeb.CoreComponents
  # alias Phoenix.LiveView.JS

  @spec unicode_display([binary()]) :: binary()
  def unicode_display(unicode) do
    str = String.replace(Enum.at(unicode, 0), "U+", "\\u")
    # List.to_string ["\x{1F54C}"]
    List.to_string [str]
  end

  def emojis_card(assigns) do
    ~H"""
      <div class="relative flex">
        <div class="justify-self-start"><h4>Emojis</h4></div>
        <div class="justify-self-end"><span class="text-sm"><%= if @emojis && Enum.count(@emojis) > 0 do %>🟢<% else %>🔴<% end %></span></div>
        <%= if @emojis && Enum.count(@emojis) > 0 do %>
          <ul class="self-center">
            <li><%= String.capitalize(@emojis.name) %></li>
            <li><%= String.capitalize(@emojis.category) %></li>
            <li><%= String.capitalize(@emojis.group) %></li>
            <li><%= @emojis.unicode %></li>
            <li><%= unicode_display(@emojis.unicode) %></li>
          </ul>
        <% end %>
      </div>
    """
  end

  def streamer_card(assigns) do
    ~H"""
    <div class="relative flex">
      <div class="justify-self-start"><h4>Streamer</h4></div>
      <div class="justify-self-end"><span class="text-xs"><%= if @streamer_svg do %>🟢<% else %>🔴<% end %></span></div>
        <%= if @streamer_svg do %><%= @streamer_svg %><% end %>
    </div>
    """
  end

  def xml_card(assigns) do
    ~H"""
    <div class="relative flex">
      <%= if @xml_data && List.first(@xml_data) do %>
        <div :for={town <- @xml_data}>
          <p><%= town.town %></p>
        </div>
      <% end %>
    </div>
    """
  end
end
