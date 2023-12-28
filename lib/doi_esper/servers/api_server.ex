defmodule DoiEsper.Servers.ApiServer do
  use GenServer
  alias DoiEsper.Entities.Address

  @time_interval_ms 2000
  @call_interval_ms 3000
  @addrs "addrs"

  def to_addr(%{"id" => id, "building_number" => building_number, "city" => city,"city_prefix" => city_prefix,"community" => community,"country" => country,"country_code" => country_code,
  "full_address" => full_address,"latitude" => latitude,"longitude" => longitude,"mail_box" => mail_box,"postcode" => postcode,"secondary_address" => secondary_address,"state" => state,"state_abbr" => state_abbr,
  "street_address" => street_address,"street_name" => street_name,"street_suffix" => street_suffix,"time_zone" => time_zone,"uid" => uid,"zip" => zip,"zip_code" => zip_code}, round_id) do

    %Address{
      id: id,
      round_id: round_id,
      building_number: building_number,
      city: city,
      city_prefix: city_prefix,
      community: community,
      country: country,
      country_code: country_code,
      full_address: full_address,
      latitude: latitude,
      longitude: longitude,
      mail_box: mail_box,
      postcode: postcode,
      secondary_address: secondary_address,
      state: state,
      state_abbr: state_abbr,
      street_address: street_address,
      street_name: street_name,
      street_suffix: street_suffix,
      time_zone: time_zone,
      uid: uid,
      zip: zip,
      zip_code: zip_code
    }
  end

  # https://random-data-api.com/api/v2/users?size=2&is_xml=true
  @spec get_addrs() :: {arg1, arg2} when arg1: atom, arg2: list()
  defp get_addrs() do
    # :error or :ok
    {atom, resp} =
      Finch.build(:get, "https://random-data-api.com/api/v2/addresses?size=5")
        |> Finch.request(DoiEsper.Finch)

    if atom == :error do
      {atom, %{"Strings" => ["Transport Error: #{resp.reason}"]}}
    else
      IO.inspect({atom, resp}, label: "Atom/Resp Tuple")
      {atom, body} =
        case resp.status do
          200 -> Jason.decode(resp.body)
          _   -> [%{"error" => "Status #{resp.status}"}]
        end
      {atom, body}
    end
  end

  def start_link([name, state]) do
    IO.inspect(state, label: "start_link")
    GenServer.start_link(__MODULE__, state, name: name)
  end

  # handle_cast handling the call from outside. Calls from the process (all subsequent) handled by handle_info
  @impl true
  def handle_cast({:fetch_resource, sym}, state) do
    Process.send_after(self(), sym, @time_interval_ms)
    IO.puts(sym)
    {:noreply, state}
  end

  @impl true
  def handle_cast({:stop_resource, sym}, state) do
    case sym do
      :streamer -> Process.cancel_timer(state.streamer_ref)
      _ -> Process.cancel_timer(state.streamer_ref)
    end
    # Process.cancel_timer(self(), sym, @time_interval_ms)
    IO.puts(sym)
    {:noreply, state}
  end

  @impl true
  def init(state) do
    # _table = :ets.new(:user_scores, [:ordered_set, :protected, :named_table])
    IO.inspect state, label: "init"
    refs_map = %{addrs_ref: nil}
    {:ok, refs_map}
  end

  defp publish(list) do
    Phoenix.PubSub.broadcast(
      DoiEsper.PubSub,
      @addrs,
      %{topic: @addrs, payload: %{status: :complete, data: list}}
    )
  end

  @impl true
  def handle_info(:addrs, state) do
    IO.inspect(state.addrs_ref, label: "Addr Ref Calling get_addrs()")
    {_atom, body} = get_addrs()
    # Body will always be a list of maps
    IO.inspect(body, label: "Body")
    round_id = Ecto.UUID.generate()
    addrs = Enum.map(body, fn addr -> to_addr(addr, round_id) end)
    IO.inspect(addrs, label: "addrs")
    # Need to be maps to do insert all. ugh.
    maps = Enum.map(addrs, fn addr -> Map.from_struct(addr) |> Map.delete(:__meta__) end)
    IO.inspect(maps, label: "maps")
    DoiEsper.Repo.insert_all(Address, maps)
    publish(body)
    addrs_ref = Process.send_after(self(), :addrs, @call_interval_ms)
    IO.inspect(addrs_ref, label: "New Addrs Ref")
    state = Map.put(state, :addrs_ref, addrs_ref)
    {:noreply, state}
  end


end
