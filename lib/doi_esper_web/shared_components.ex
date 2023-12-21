defmodule DoiEsperWeb.SharedComponents do
  use Phoenix.Component
  # alias Phoenix.LiveView.JS

  def display_card(assigns) do
    ~H"""
    The chosen city is: <%= @name %>.
    """
  end

  def button_card(assigns) do
    ~H"""
    <div class="grid grid-cols-3 gap-4 w-full">
      <div class="basis-1/4 flex flex-col items-center justify-center">
        <button
          type="button"
          phx-click="service_casted"
          phx-value-op={if @clicked_map && @clicked_map[1] do :fetch_resource else :fetch_resource end}
          phx-value-res={:xml_parse}
          phx-value-castto={:xml_server}
          phx-value-id={if @clicked_map && @clicked_map[1] do 1 else 1 end}
          value={1}
          class="inline-block rounded border-2 border-success w-3/3 px-2 pb-[6px] pt-2 text-xs font-medium uppercase leading-normal text-success transition duration-150 ease-in-out hover:border-success-600 hover:bg-neutral-500 hover:bg-opacity-10 hover:text-success-600 focus:border-success-600 focus:text-success-600 focus:outline-none focus:ring-0 active:border-success-700 active:text-success-700 dark:hover:bg-neutral-100 dark:hover:bg-opacity-10"
        ><%= if @clicked_map && @clicked_map[1] do %>Stop XML<% else %>Start XML<% end %>
        </button>
      </div>
      <div class="basis-1/4 flex flex-col items-center justify-center">
        <button
          type="button"
          phx-click="service_casted"
          phx-value-op={if @clicked_map && @clicked_map[2] do :fetch_resource else :fetch_resource end}
          phx-value-res={:emojis}
          phx-value-castto={:consumer_2}
          phx-value-id={if @clicked_map && @clicked_map[2] do 2 else 2 end}
          value={2}
          class="inline-block rounded border-2 border-success w-3/3 px-2 pb-[6px] pt-2 text-xs font-medium uppercase leading-normal text-success transition duration-150 ease-in-out hover:border-success-600 hover:bg-neutral-500 hover:bg-opacity-10 hover:text-success-600 focus:border-success-600 focus:text-success-600 focus:outline-none focus:ring-0 active:border-success-700 active:text-success-700 dark:hover:bg-neutral-100 dark:hover:bg-opacity-10"
        ><%= if @clicked_map && @clicked_map[2] do %>Stop Emojis<% else %>Start Emojis<% end %>
        </button>
      </div>
    </div>
    """
  end
end
