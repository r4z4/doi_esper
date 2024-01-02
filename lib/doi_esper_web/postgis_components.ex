defmodule DoiEsperWeb.PostgisComponents do
  use DoiEsperWeb, :live_view
  use Phoenix.Component
  # alias Phoenix.LiveView.JS

  def postgis_card(assigns) do
    ~H"""
      <div>
        <div>
          <.form for={@form} phx-change="validate" phx-submit="submit">
            <.label for={"address"}>Address <%= if @form[:valid] do "🟢" else "🔴" end %></.label>
            <.input type="text" name="address" value="" class="w-full" field={@form[:address]} />
            <div class="flex flex-wrap -mx-3 mb-2">
              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <.label for={"city"}>City</.label>
                <.input type="text" name="city" value="" class="w-full" field={@form[:city]} />
              </div>
              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <.label for={"state"}>State</.label>
                <.input type="text" name="state" value="" class="w-full" field={@form[:state]} />
              </div>
              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <.label for={"zip"}>Zip Code</.label>
                <.input type="text" name="zip" value="" field={@form[:zip]} />
              </div>
            </div>
            <fieldset>
            <.input field={@form[:entity]}
              class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
              id="entity_hospital"
              name="entity"
              type="radio"
              label="Hospital"
              value={:hospital}
            />
            <.input field={@form[:entity]}
              class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
              id="entity_college"
              name="entity"
              type="radio"
              label="College"
              value={:college}
            />
            <.input field={@form[:entity]}
              class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
              id="entity_arena"
              name="entity"
              type="radio"
              label="Arena"
              value={:arena}
            />
          </fieldset>
            <button
              class="mt-4 inline-block cursor-pointer rounded border-2 border-success w-3/3 px-2 pb-[6px] pt-2 text-xs font-medium uppercase leading-normal text-success transition duration-150 ease-in-out hover:border-success-600 hover:bg-neutral-500 hover:bg-opacity-10 hover:text-success-600 focus:border-success-600 focus:text-success-600 focus:outline-none focus:ring-0 active:border-success-700 active:text-success-700 dark:hover:bg-neutral-100 dark:hover:bg-opacity-10"
              disabled={!@form[:valid]}>Submit
            </button>
          </.form>
        </div>
      </div>
    """
  end

  def postgis_display(assigns) do
    ~H"""
      <div>
        <div><h4>PostGIS Data</h4></div>
          <div class="">
            <%= if @postgis_addr do %>
              <h5><%= @postgis_addr %></h5>
            <% end %>
            <%= if @postgis_data && Enum.count(@postgis_data.data) > 0 do %>
              <div>
                <h5>Results</h5>
                <ul>
                  <%= for entry <- @postgis_data.data do %>
                    <li><%= entry.name %></li>
                    <li><%= entry.dist %></li>
                    <%= if @postgis_data.entity == :arena do %>
                      <li><%= entry.conference %></li>
                    <% end %>
                  <% end %>
                </ul>
              </div>
            <% end %>
          </div>
      </div>
    """
  end
end
