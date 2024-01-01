defmodule DoiEsperWeb.PostgisComponents do
  use DoiEsperWeb, :live_view
  use Phoenix.Component
  # alias Phoenix.LiveView.JS

  def postgis_card(assigns) do
    ~H"""
      <div class="relative flex">
        <div>
        <p><%= if @form[:valid] do "Valid" else "Invalid" end %></p>
        <.form for={@form} phx-change="validate" phx-submit="submit">
          <.input type="text" name="address" value="" field={@form[:address]} />
          <button disabled={!@form[:valid]}>Submit</button>
        </.form>
      </div>
      <button
        type="button"
        phx-click="service_casted"
        phx-value-op={:fetch_resource}
        phx-value-res={:emojis}
        phx-value-castto={:consumer_2}
        phx-value-id={2}
        value={2}
        class="inline-block rounded border-2 border-success w-3/3 px-2 pb-[6px] pt-2 text-xs font-medium uppercase leading-normal text-success transition duration-150 ease-in-out hover:border-success-600 hover:bg-neutral-500 hover:bg-opacity-10 hover:text-success-600 focus:border-success-600 focus:text-success-600 focus:outline-none focus:ring-0 active:border-success-700 active:text-success-700 dark:hover:bg-neutral-100 dark:hover:bg-opacity-10"
      >Find Nearest #2
      </button>
      </div>
    """
  end

  def postgis_display(assigns) do
    ~H"""
      <div class="relative flex">
        <div class="justify-self-start"><h4>PostGIS Data</h4></div>
        <%= if @postgis_data && Enum.count(@postgis_data) > 0 do %>
          <h5>Results</h5>
          <ul>
            <%= for entry <- @postgis_data do %>
              <li><%= List.first(entry) %></li>
              <li><%= List.last(entry) %></li>
            <% end %>
          </ul>
        <% end %>
      </div>
    """
  end
end
